# Dot-Boxes-Game

rules :
Dots and Boxes is a game of two players. In the implementation you can play agains the computer or agains another Player.
The game board consists of points, that placed at equal intervals on the board, from each 4 adjacent points you can construcd a square.
You move by connecting two dots with a line. When you place the last line of a single square(box), the box is yours.
Whenever a player takes a box he must move again. 
The game ends when all the boxes have been taken. 
The player with the most boxes wins.

implementation:
The program has lists that maintains the players, dots and squares.
The Computer Player moves implemented by priority list of facts(Prolog), that simulates the steps a skilled player would take in a game.
The game has 2 level of difficulty that changes by the list of facts the computer can take in his turn.

The projects include Graphic realization. to see it, grab all the image from the image folder to your Prolog bitmap folder and start playing. 
