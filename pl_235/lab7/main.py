from lab07 import Life
import time
from typing import Iterator

toad = [".###",
"###."]
blinker = ["###"]
block = ["..##..",
"..##.."]
glidergun = [
"...................................#............",
".................................#.#............",
".......................##......##............##.",
"......................#...#....##............##.",
"...........##........#.....#...##...............",
"...........##........#...#.##....#.#............",
".....................#.....#.......#............",
"......................#...#.....................",
".......................##......................." ]
lf = Life( 50, 80 )
lf. addfigure( 10,10, glidergun )
lf. addfigure( 30, 10, toad )
lf. addfigure( 40, 15, blinker )
while True:
    print( lf )
    print( "press Ctrl-C tostop" )
    lf. nextstate( )
    time. sleep( 0.25 )