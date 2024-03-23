import time
from typing import Iterator

class Life :
	m :int
	n :int
	state :[[]]
	def __init__(self, m:int, n:int) -> None:
		self.state = [[False for i in range(n)] for j in range(m)]
		self.m = m
		self.n = n

	def __repr__(self) -> str:
		return str(self.state)

	def neighbours(self, m:int, n:int) -> Iterator[tuple[int, int]]:
		ls = []

		if (m - 1) > 0 and (n-1) > 0:
			ls.append((m - 1, n - 1))
		if (m-1) > 0:
			ls.append((m - 1, n))
		if (m-1) > 0 and (n+1) < self.n:
			ls.append((m - 1, n + 1))
		if (n-1) > 0:
			ls.append((m, n - 1))
		if (n+1) < self.n:
			ls.append((m, n+1))
		if (m+1) < self.m and (n-1) > 0:
			ls.append((m+1, n-1))
		if (m+1) < self.m:
			ls.append((m+1, n))
		if (m+1) < self.m and (n + 1) < self.n:
			ls.append((m+1,n+1))
		return ls
	def numalive(self, ls:list) -> int:
		alive = 0		
		for i in ls:
			if self.state[i[0]][i[1]]:
				alive+= 1
		return alive

	def nextstate( self ) -> None:
		next = [[False for i in range(self.n)] for j in range(self.m)]
		for i in range(self.m):
			for j in range(self.n):
				boo = self.state[i][j]
				alive = self.numalive(self.neighbours(i, j))
				if(boo == True and (alive == 2 or alive == 3)):
					next[i][j] = True
				if(boo == False and alive == 3):
					next[i][j] = True
		self.state = next
	
	def addfigure(self,i:int, j:int, figure:list[str]) -> None:
		if i < 0 or j < 0 or (len(figure[0]) + j) > self.n or (len(figure) + i) > self.m:
			raise ValueError
		for row, line in enumerate(figure):
			for col, ch in enumerate(line):
				if ch != "." and ch != " ":
					self.state[i + row][j + col] = True
	
	def __str__(self) -> str:
		out = ""
		for i in self.state:
			line = "".join("#" if ch else "." for ch in i)
			out += line + "\n"
		return out
			
