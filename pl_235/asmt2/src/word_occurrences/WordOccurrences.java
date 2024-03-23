
package word_occurrences;

import java.io.*;
import java.util.Map;
//import java.util.Set;
import java.util.TreeMap;
import java.util.TreeSet;

public class WordOccurrences {

    // Maps words -> filename -> sets of their Positions in the file.
    private final TreeMap<String, TreeMap<String, TreeSet<FilePosition>>> occMap;

    /**
     * Create a new object that stores word occurrence information of
     * the contents of all files at or below the given document or directory
     * in the file hierarchy.
     *
     * @param docOrRootDir the single file to be read, or the root directory
     *                     containing the (sub)files to be read
     * @throws IOException if there is a problem accessing the given files
     */
    public WordOccurrences(File docOrRootDir) throws IOException {
        occMap = new TreeMap<>();
        buildMap(docOrRootDir);
    }

    /**
     * Helper method that adds the occurrence information to the occurrence
     * map for the given file if it is a text document, or for all subfiles
     * below if it is a directory.  This method should not access the occMap
     * map directly, but rather, it should make use of the addMapEntry method
     * to manage the occMap
     *
     * @param docOrDir the single file to be read, or the root directory
     *                 containing the (sub)files to be read
     * @throws IOException if there is a problem accessing the given files
     */
    private void buildMap(File docOrDir) throws IOException {

        try {
            if(!docOrDir.exists()){
                throw new IOException("Problems with accessing file");
            }
            if(docOrDir.isDirectory()){
                File[] contents = docOrDir.listFiles();
                for(File file: contents){
                    buildMap(file);
                }
            }
            if(docOrDir.isFile()){
                BufferedReader read = new BufferedReader(new FileReader(docOrDir));
                int ch;
                int line = 1;
                int column = 0;
                StringBuilder word = new StringBuilder();
                FilePosition fp;
                do{
                    ch = read.read();
                    if(Syntax.isInWord((char)ch)){
                        column += 1;
                        word.append((char)ch);
                    }else{
                        column += 1;
                        if(word.length() != 0){
                            fp = new FilePosition(line, column - word.length());
                            addMapEntry(word.toString(), docOrDir.getPath(), fp);
                            word = new StringBuilder();
                        }
                    }
                    if(Syntax.isNewLine((char)ch)){
                        column = 0;
                        line += 1;
                    }

                }while(ch != -1);
                read.close();

            }

        } catch (IOException message) {
            System.err.println("Caught an IOException: " + message.getMessage());
        }
        // TODO: Implement me!!!
    }


    /**
     * Helper method for buildMap, which records the occurrence of the
     * given word, in the given file, at the given position in occMap.
     * Note that because occMap is a two-level map.... i.e., it is a map
     * whose values are also maps, new maps may need to be added as values
     * to the occMap whenever a new word is encountered while the input
     * files are being read
     *
     * @param word the word whose occurrence should be recorded
     * @param filePath the path of the file in which the current word
     *                 occurrence is located
     * @param pos the position of the word in the given file
     */
    private void addMapEntry(String word, String filePath, FilePosition pos) {
        word = word.toLowerCase();
        if(occMap.containsKey(word)){
            if(occMap.get(word).containsKey(filePath)){
                occMap.get(word).get(filePath).add(pos);
            }else{
                TreeSet<FilePosition> inpos = new TreeSet<>();
                inpos.add(pos);
                occMap.get(word).put(filePath, inpos);
            }
        }else{
            TreeSet<FilePosition> inpos = new TreeSet<>();
            TreeMap<String, TreeSet<FilePosition>> infile = new TreeMap<>();
            inpos.add(pos);
            infile.put(filePath, inpos);
            occMap.put(word, infile);
        }

        // TODO: Implement me!!!
    }


    /**
     * @return the number of distinct words found in the files
     */
    public int distinctWords() {

        // TODO: Implement me!!!
        return occMap.size();
    }

    /**
     * @return the number of total word occurrences across all files
     */
    public int totalOccurrences() {
        int total = 0;
        for(TreeMap<String, TreeSet<FilePosition>> outer : occMap.values()){
            for(TreeSet<FilePosition> inner : outer.values()){
                total += inner.size();
            }
        }
        // TODO: Implement me!!!

        return total;
    }

    /**
     * Finds the total number of occurrences of a given word across
     * all files.  If the word is not found among the occurrences,
     * simply return 0.
     *
     * @param word whose occurrences we are counting
     * @return the number of occurrences
     */
    public int totalOccurrencesOfWord(String word) {
        int total = 0;
        if(occMap.containsKey(word)){
            TreeMap<String, TreeSet<FilePosition>> check = occMap.get(word);
            for(TreeSet<FilePosition> pos : check.values()){
                total += pos.size();
            }
        }

        // TODO: Implement me!!!
        return total;
    }

    /**
     * Finds the total number of occurrences of a given word in the given file.
     * If the file is not found in Occurrences, or if the word does not occur
     * in the file, simply return 0.
     *
     * @param word whose occurrences we are counting
     * @param filepath of the file
     * @return the number of occurrences
     */
    public int totalOccurrencesOfWordInFile(String word, String filepath) {
        int total = 0;
        if(occMap.containsKey(word) && occMap.get(word).containsKey(filepath)){
            TreeSet<FilePosition> check = occMap.get(word).get(filepath);
            total = check.size();
        }

        // TODO: Implement me!!!
        return total;
    }

    /**
     *
     * @return a string representation of the contents of the occurrence map
     */
    public String toString() {
        StringBuilder out = new StringBuilder();

        for (Map.Entry<String, TreeMap<String, TreeSet<FilePosition>>> outer : occMap.entrySet()) {
            out.append("\"" + outer.getKey() + "\" has " + totalOccurrencesOfWord(outer.getKey()) + " occurrence(s):\n");
            for (Map.Entry<String, TreeSet<FilePosition>> inner : outer.getValue().entrySet()) {

                for (FilePosition fp : inner.getValue()) {
                    out.append("    " + "( file: " + "\"" + inner.getKey() + "\"" + "; " + fp.toString() + " )\n");
                }
            }
        }


        // TODO: Implement me!!!
        return out.toString();
    }
}


