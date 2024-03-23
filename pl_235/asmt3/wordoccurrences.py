
from fileposition import FilePosition
from typing import Optional, Iterator

import syntax
import os

class WordOccurrences : 

	occMap : dict[ str, dict[ str, set[ FilePosition ]]] 

	
	def __init__( self, docOrRootDirPath : str ) :
		self.occMap = dict( )
		self.buildMap( docOrRootDirPath )


	# Used by the constructor to populate the occMap
	def buildMap( self, docOrDirPath : str ) -> None :

		# Raise an error if the document or directory does not exist
		if not os.path.exists( docOrDirPath ) :
			raise FileNotFoundError
		
		# Get the filepaths of all files at or below docOrDirPath, and
		# iterate through them
		for filepath in WordOccurrences.allFiles(docOrDirPath) :
		
			 # Process each file by retrieving each word instance and location
			# using the occurrences iterator, and then store each one in the 
			# occMap by calling addMapEntry
			for word, line, column in WordOccurrences.occurrences(filepath) :
				self.addMapEntry( word, filepath, FilePosition(line, column) )
		
		
	# Generator which yields all of the files at or below the given root file 
	# or directory.  It is static, since it does not need to access the occMap.
	@staticmethod	
	def allFiles( docOrDirPath : str ) -> Iterator[ str ] :
		# Implement me!!!
		if not(os.path.isdir(docOrDirPath)):
			yield docOrDirPath
   
		for dir, subdir, file in os.walk(docOrDirPath):
			for i in file:
				yield os.path.join(dir, i)
			
	  
						  
					
	# Generator which yields all word occurrences within the file along with 
	# their line and column numbers.  It is static, since it does not need to 
	# access the occMap.
	@staticmethod
	def occurrences( filepath : str ) -> Iterator[ tuple[str, int, int] ] :
		
		infile = open( filepath, "r", encoding = "utf8" )
		# Implement me!!!
		buf = ""
		col = 0
		lnn = 1
		for line in infile:
			for ch in line:
				if syntax.inWord(ch):
					col += 1
					buf += ch
				else:
					col += 1
					if(len(buf) != 0):
						yield buf, lnn, col-len(buf)
						buf = ""
				if syntax.isNewLine(ch):
					col = 0
					lnn += 1
		infile.close()
		
		
	# Helper function for buildMap, which records the occurrence of the
	# given word, in the given file, at the given position in occMap
	def addMapEntry( self, word : str, filePath : str, pos : FilePosition ) -> None :
		word = word.lower()
		if not (self.occMap.get(word) is None) :
			if not (self.occMap.get(word).get(filePath) is None):
				self.occMap.get(word).get(filePath).add(pos)
			else:
				inpos = set()
				inpos.add(pos)
				self.occMap.get(word).update({filePath : inpos})
		else:
			inpos = set()
			inpos.add(pos)
			self.occMap.update({word:{filePath:inpos}})

	# Returns the number of distinct words across all files
	def distinctWords( self ) -> int : 
		# Implement me!!!
		
		return len(self.occMap)


	
	# Returns the total number of occurrences of a given word, if both are provided;
	# Returns the total number of occurrences of a given word across all files, if only
	#		the word is given;
	# Returns the total number of all word occurrences across all files, if neither the
	#		word nor the filepath is given
	def totalOccurrences( self, 
						  word : Optional[str] = None, 
						  filepath : Optional[str] = None ) -> int :
		# Implement me!!!
		total = 0
		if filepath:
			return len(self.occMap.get(word, {}).get(filepath, set()))
		if word:
			for i in self.occMap.get(word, {}).values():
				total += len(i)
			return total
		for i in self.occMap.values():
			for j in i.values():
				total += len(j)
		return total


	# This is for debugging, so it doesn't need to be pretty
	def __repr__( self ) -> str : 
		# Just output the stringified version of the occMap dictionary
		return str( self.occMap )

		
	# Returns a string representation of the contents of the occurrence map
	def __str__( self ) -> str : 
		# Implement me!!!
		out = []
		for word, files in sorted(self.occMap.items()):
			occ = self.totalOccurrences(word)
			out.append(f'"{word}" has {occ} occurence(s):')
			for file, pos in sorted(files.items()):
				for i in sorted(pos, key = lambda x:x.line):
					out.append(f'	( file: "{file}"; {i} )')
		return '\n'.join(out)
 