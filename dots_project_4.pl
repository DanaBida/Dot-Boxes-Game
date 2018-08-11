% This buffer is for notes you don't want to save.
% If you want to create a file, visit that file with C-x C-f,
% then enter the text in that file's own buffer.
:-dynamic pointsList/1.
:-dynamic squaresList/1.
:-dynamic players/1.
%%% scorePlayer(NumofScore,TheAppropriatePicture) %%%
%scoreRed(sumScoreRed,Pic).
scoreRed(0,'0r.bmp').
scoreRed(1,'1r.bmp').
scoreRed(2,'2r.bmp').
scoreRed(3,'3r.bmp').
scoreRed(4,'4r.bmp').
scoreRed(5,'5r.bmp').
scoreRed(6,'6r.bmp').
scoreRed(7,'7r.bmp').
scoreRed(8,'8r.bmp').
scoreRed(9,'9r.bmp').
scoreRed(10,'10r.bmp').
scoreRed(11,'11r.bmp').
scoreRed(12,'12r.bmp').
scoreRed(13,'13r.bmp').
scoreRed(14,'14r.bmp').
scoreRed(15,'15r.bmp').
scoreRed(16,'16r.bmp').
scoreRed(17,'17r.bmp').
scoreRed(18,'18r.bmp').
scoreRed(19,'19r.bmp').
scoreRed(20,'20r.bmp').
scoreRed(21,'21r.bmp').
scoreRed(22,'22r.bmp').
scoreRed(23,'23r.bmp').
scoreRed(24,'24r.bmp').
scoreRed(25,'25r.bmp').

%scoreGreen(sumScoreGreen,Pic).
scoreGreen(0,'0g.bmp').
scoreGreen(1,'1g.bmp').
scoreGreen(2,'2g.bmp').
scoreGreen(3,'3g.bmp').
scoreGreen(4,'4g.bmp').
scoreGreen(5,'5g.bmp').
scoreGreen(6,'6g.bmp').
scoreGreen(7,'7g.bmp').
scoreGreen(8,'8g.bmp').
scoreGreen(9,'9g.bmp').
scoreGreen(10,'10g.bmp').
scoreGreen(11,'11g.bmp').
scoreGreen(12,'12g.bmp').
scoreGreen(13,'13g.bmp').
scoreGreen(14,'14g.bmp').
scoreGreen(15,'15g.bmp').
scoreGreen(16,'16g.bmp').
scoreGreen(17,'17g.bmp').
scoreGreen(18,'18g.bmp').
scoreGreen(19,'19g.bmp').
scoreGreen(20,'20g.bmp').
scoreGreen(21,'21g.bmp').
scoreGreen(22,'22g.bmp').
scoreGreen(23,'23g.bmp').
scoreGreen(24,'24g.bmp').
scoreGreen(25,'25g.bmp').

%%% the points in the board %%%
%p((X,Y),Up,Down,Right,Left).
%X: queue number
%Y: line number
%(-1): no exist
%1: full
%0: empty
p((1,1),-1,0,0,-1).
p((2,1),-1,0,0,0).
p((3,1),-1,0,0,0).
p((4,1),-1,0,0,0).
p((5,1),-1,0,0,0).
p((6,1),-1,0,-1,0).

p((1,2),0,0,0,-1).
p((2,2),0,0,0,0).
p((3,2),0,0,0,0).
p((4,2),0,0,0,0).
p((5,2),0,0,0,0).
p((6,2),0,0,-1,0).

p((1,3),0,0,0,-1).
p((2,3),0,0,0,0).
p((3,3),0,0,0,0).
p((4,3),0,0,0,0).
p((5,3),0,0,0,0).
p((6,3),0,0,-1,0).

p((1,4),0,0,0,-1).
p((2,4),0,0,0,0).
p((3,4),0,0,0,0).
p((4,4),0,0,0,0).
p((5,4),0,0,0,0).
p((6,4),0,0,-1,0).

p((1,5),0,0,0,-1).
p((2,5),0,0,0,0).
p((3,5),0,0,0,0).
p((4,5),0,0,0,0).
p((5,5),0,0,0,0).
p((6,5),0,0,-1,0).

p((1,6),0,-1,0,-1).
p((2,6),0,-1,0,0).
p((3,6),0,-1,0,0).
p((4,6),0,-1,0,0).
p((5,6),0,-1,0,0).
p((6,6),0,-1,-1,0).


start:-
	initGame,
	openWindow.

openWindow:-
	new(W,window('dots and boxes', size(900,800))),
	menu(W).

menu(W):-
	new(B,bitmap('reka.bmp')),
	send(W,background,B),
	new(HftH,bitmap('playvsfriend.bmp')),
	send(W,display,HftH,point(300,310)),
	new(HftC_easy,bitmap('playvscomputer_easy.bmp')),
	send(W,display,HftC_easy,point(210,410)),
	new(HftC_hard,bitmap('playvscomputer_hard.bmp')),
	send(W,display,HftC_hard,point(210,510)),
	new(R,bitmap('Rules.bmp')),
	send(W,display,R,point(385,610)),
	new(A,bitmap('About.bmp')),
	send(W,display,A,point(379,705)),
	send(W,open),
       	send(R,recogniser,click_gesture(left,'',single,
             and(message(@prolog,openRules,W)))),
	send(A,recogniser,click_gesture(left,'',single,
             and(message(@prolog,openAbout,W)))),
      	send(HftH,recogniser,click_gesture(left,'',single,
             and(message(@prolog,openPlay_HftH,W)))),
	send(HftC_easy,recogniser,click_gesture(left,'',single,
             and(message(@prolog,openPlay_HftCEasy,W)))),
	send(HftC_hard,recogniser,click_gesture(left,'',single,
             and(message(@prolog,openPlay_HftCHard,W)))).

% the back button pressed - return to the menu.
back_deleteOld(W):-
	send(W,clear),
	initGame,
	menu(W).


% the playVSfriend button pressed - open this game kind.
openPlay_HftH(W):-
	initPlayers(humanfthuman),
       	send(W,clear),
	new(PR,bitmap('play_reka_cleen.bmp')),
      	send(W,background,PR),
      	new(D,bitmap('dotsNboxes.bmp')),
	send(W,display,D,point(16,3)),
      	new(Back,bitmap('backTOmenu.gif')),
	send(W,display,Back,point(700,660)),
	send(Back,recogniser,click_gesture(left,'',single,
	     and(message(@prolog,back_deleteOld,W)))),
       	addPointsToBored(W,1),
	drawHLines(W,1),
	drawVLines(W,1),
	showPlayerTurn(W),
      	showScores(W),
	squaresList(FullSquaresList),
	showSquares(W,FullSquaresList),
       	send(W,open),
	playMove(W).

% the playVScomputer_easylevel button pressed - open this game kind.
openPlay_HftCEasy(W):-
	initPlayers(humanftcomputer_easy),
       	send(W,clear),
	new(PR,bitmap('play_reka_cleen.bmp')),
      	send(W,background,PR),
      	new(D,bitmap('dotsNboxes.bmp')),
	send(W,display,D,point(16,3)),
      	new(Back,bitmap('backTOmenu.gif')),
	send(W,display,Back,point(700,660)),
	send(Back,recogniser,click_gesture(left,'',single,
	     and(message(@prolog,back_deleteOld,W)))),
       	addPointsToBored(W,1),
	drawHLines(W,1),
	drawVLines(W,1),
	showPlayerTurn(W),
      	showScores(W),
	squaresList(FullSquaresList),
	showSquares(W,FullSquaresList),
       	send(W,open),
	playMove(W).

% the playVScomputer_hardlevel button pressed - open this game kind.
openPlay_HftCHard(W):-
	initPlayers(humanftcomputer_hard),
       	send(W,clear),
	new(PR,bitmap('play_reka_cleen.bmp')),
      	send(W,background,PR),
      	new(D,bitmap('dotsNboxes.bmp')),
	send(W,display,D,point(16,3)),
      	new(Back,bitmap('backTOmenu.gif')),
	send(W,display,Back,point(700,660)),
	send(Back,recogniser,click_gesture(left,'',single,
	     and(message(@prolog,back_deleteOld,W)))),
       	addPointsToBored(W,1),
	drawHLines(W,1),
	drawVLines(W,1),
	showPlayerTurn(W),
      	showScores(W),
	squaresList(FullSquaresList),
	showSquares(W,FullSquaresList),
       	send(W,open),
	playMove(W).



openRules(W):-
      	send(W,clear),
	new(RR,bitmap('rulesreka.bmp')),
       	send(W,background,RR),
	send(W,open),
	new(Back,bitmap('backTOmenu.gif')),
	send(W,display,Back,point(705,660)),
       	send(Back,recogniser,click_gesture(left,'',single,
	     and(message(@prolog,back_deleteOld,W)))).


openAbout(W):-
	send(W,clear),
	new(AR,bitmap('aboutreka.bmp')),
       	send(W,background,AR),
	send(W,open),
	new(Back,bitmap('backTOmenu.gif')),
	send(W,display,Back,point(705,660)),
       	send(Back,recogniser,click_gesture(left,'',single,
	     and(message(@prolog,back_deleteOld,W)))).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%% the computer moves %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%create a list of all the possible lines- horizontal and vertical
%that the computer could choose (no one choose them yet).
createListOfAllPossibleMoves(MovesList):-
	pointsList(Points),
	findall(move(horizontal,X,Y),member(p((X,Y),_,_,0,_),Points),Lhorizontal),
	findall(move(vertical,X,Y)  ,member(p((X,Y),_,0,_,_),Points),Lvertical),
	append(Lhorizontal,Lvertical,MovesList),
	writeln(['moves list : ',MovesList]).


%%%%player AI%%%%
%the move that the computer will do:

%for easy level - choose random move.
chooseMoveForEasyAI(W):-
	createListOfAllPossibleMoves(ML),
	length(ML,Len),
	Index is random(Len)+1,
	nth1(Index,ML,move(Dir,X,Y)),
	makeAIMove(W,Dir,X,Y).


%for hard level

%%%for close square%%%
%for horizontal close return Score=1.
horizontalAtXYasTopLeftCorner(X,Y,Score):-
	pointsList(PointsList),
	member(p((X,Y),_,1,0,_),PointsList),
	XPlus1 is X+1,
	YPlus1 is Y+1,
	member(p((XPlus1,YPlus1),1,_,_,1),PointsList),
	Score is 1.
horizontalAtXYasTopLeftCorner(_,_,0).

horizontalAtXYasDownLeftCorner(X,Y,Score):-
	pointsList(PointsList),
	member(p((X,Y),1,_,0,_),PointsList),
	XPlus1 is X+1,
	YMinus1 is Y-1,
	member(p((XPlus1,YMinus1),_,1,_,1),PointsList),
	Score is 1.
horizontalAtXYasDownLeftCorner(_,_,0).

%for vertical close return Score=1.
verticalAtXYasTopLeftCorner(X,Y,Score):-
	pointsList(PointsList),
	member(p((X,Y),_,0,1,_),PointsList),
	XPlus1 is X+1,
	YPlus1 is Y+1,
	member(p((XPlus1,YPlus1),1,_,_,1),PointsList),
	Score is 1.
verticalAtXYasTopLeftCorner(_,_,0).

verticalAtXYasTopRightCorner(X,Y,Score):-
	pointsList(PointsList),
	member(p((X,Y),_,0,_,1),PointsList),
	XMinus1 is X-1,
	YPlus1 is Y+1,
	member(p((XMinus1,YPlus1),1,_,1,_),PointsList),
	Score is 1.
verticalAtXYasTopRightCorner(_,_,0).


%make a list of all the lines that will close a squares.
closeSquaresList(CloseList):-
	horizontalCloseSquaresList(CloseHlist),
	verticalCloseSquaresList(CloseVlist),
	append(CloseHlist,CloseVlist,CloseList),
      	writeln(['close list : ',CloseList]).

%make a list of all the horizontal lines that will close a squares.
horizontalCloseSquaresList(CloseHlist):-
	createListOfAllPossibleMoves(ML),
	findall(close(horizontal,X,Y),( member(move(horizontal,X,Y),ML),
					horizontalAtXYasTopLeftCorner(X,Y,1);
					horizontalAtXYasDownLeftCorner(X,Y,1) ),
		CloseHlist).

%make a list of all the vertical lines that will close a squares.
verticalCloseSquaresList(CloseVlist):-
	createListOfAllPossibleMoves(ML),
	findall(close(vertical,X,Y),( member(move(vertical,X,Y),ML),
				      verticalAtXYasTopLeftCorner(X,Y,1);
				      verticalAtXYasTopRightCorner(X,Y,1) ),
		CloseVlist).

%%%for 3 Line- like this, the human player will close a square%%%

%for horizontal 3 line return Flag=1.
line3HorizontalAtXYasTopLeftCorner(X,Y,Flag):-
	pointsList(PointsList),
	member(p((X,Y),_,1,0,_),PointsList),
	XPlus1 is X+1,
	YPlus1 is Y+1,
	member(p((XPlus1,YPlus1),1,_,_,0),PointsList),
	Flag is 1.

line3HorizontalAtXYasTopLeftCorner(X,Y,Flag):-
	pointsList(PointsList),
	member(p((X,Y),_,1,0,_),PointsList),
	XPlus1 is X+1,
	YPlus1 is Y+1,
	member(p((XPlus1,YPlus1),0,_,_,1),PointsList),
	Flag is 1.

line3HorizontalAtXYasTopLeftCorner(X,Y,Flag):-
	pointsList(PointsList),
	member(p((X,Y),_,0,0,_),PointsList),
	XPlus1 is X+1,
	YPlus1 is Y+1,
	member(p((XPlus1,YPlus1),1,_,_,1),PointsList),
	Flag is 1.

line3HorizontalAtXYasTopLeftCorner(_,_,0).



line3HorizontalAtXYasDownLeftCorner(X,Y,Flag):-
	pointsList(PointsList),
	member(p((X,Y),1,_,0,_),PointsList),
	XPlus1 is X+1,
	YMinus1 is Y-1,
	member(p((XPlus1,YMinus1),_,1,_,0),PointsList),
	Flag is 1.

line3HorizontalAtXYasDownLeftCorner(X,Y,Flag):-
	pointsList(PointsList),
	member(p((X,Y),1,_,0,_),PointsList),
	XPlus1 is X+1,
	YMinus1 is Y-1,
	member(p((XPlus1,YMinus1),_,0,_,1),PointsList),
	Flag is 1.

line3HorizontalAtXYasDownLeftCorner(X,Y,Flag):-
	pointsList(PointsList),
	member(p((X,Y),0,_,0,_),PointsList),
	XPlus1 is X+1,
	YMinus1 is Y-1,
	member(p((XPlus1,YMinus1),_,1,_,1),PointsList),
	Flag is 1.

line3HorizontalAtXYasDownLeftCorner(_,_,0).



%for vertical 3 line return Flag=1.
line3VerticalAtXYasTopLeftCorner(X,Y,Flag):-
	pointsList(PointsList),
	member(p((X,Y),_,0,1,_),PointsList),
	XPlus1 is X+1,
	YPlus1 is Y+1,
	member(p((XPlus1,YPlus1),0,_,_,1),PointsList),
	Flag is 1.

line3VerticalAtXYasTopLeftCorner(X,Y,Flag):-
	pointsList(PointsList),
	member(p((X,Y),_,0,1,_),PointsList),
	XPlus1 is X+1,
	YPlus1 is Y+1,
	member(p((XPlus1,YPlus1),1,_,_,0),PointsList),
	Flag is 1.

line3VerticalAtXYasTopLeftCorner(X,Y,Flag):-
	pointsList(PointsList),
	member(p((X,Y),_,0,0,_),PointsList),
	XPlus1 is X+1,
	YPlus1 is Y+1,
	member(p((XPlus1,YPlus1),1,_,_,1),PointsList),
	Flag is 1.

line3VerticalAtXYasTopLeftCorner(_,_,0).



line3VerticalAtXYasTopRightCorner(X,Y,Flag):-
	pointsList(PointsList),
	member(p((X,Y),_,0,_,1),PointsList),
	XMinus1 is X-1,
	YPlus1 is Y+1,
	member(p((XMinus1,YPlus1),0,_,1,_),PointsList),
	Flag is 1.

line3VerticalAtXYasTopRightCorner(X,Y,Flag):-
	pointsList(PointsList),
	member(p((X,Y),_,0,_,1),PointsList),
	XMinus1 is X-1,
	YPlus1 is Y+1,
	member(p((XMinus1,YPlus1),1,_,0,_),PointsList),
	Flag is 1.

line3VerticalAtXYasTopRightCorner(X,Y,Flag):-
	pointsList(PointsList),
	member(p((X,Y),_,0,_,0),PointsList),
	XMinus1 is X-1,
	YPlus1 is Y+1,
	member(p((XMinus1,YPlus1),1,_,1,_),PointsList),
	Flag is 1.

line3VerticalAtXYasTopRightCorner(_,_,0).


%make a list of all the 3 lines that if the computer choose them,
%the human player will close a square.
line3List(Line3List):-
	line3horizontalList(Line3_hList),
	line3verticalList(Line3_vList),
	append(Line3_hList,Line3_vList,Line3List).

%make a list of all the possible moves that if the computer choose them,
%the human player wont close a square.
not_line3List(Not_line3List):-
	createListOfAllPossibleMoves(ML),
	line3List(Line3List),
	findall(not_line3(LineType,X,Y),( member(move(LineType,X,Y),ML),
					  not(member(line3(LineType,X,Y),Line3List)) ),
		Not_line3List),
      	writeln(['not line 3  list : ',Not_line3List]).


%make a list of all the horizontal lines that will close a squares.
line3horizontalList(Line3_hList):-
	createListOfAllPossibleMoves(ML),
	findall(line3(horizontal,X,Y),( member(move(horizontal,X,Y),ML),
					line3HorizontalAtXYasTopLeftCorner(X,Y,1);
					line3HorizontalAtXYasDownLeftCorner(X,Y,1) ),
		Line3_hList).

%make a list of all the vertical lines that will close a squares.
line3verticalList(Line3_vList):-
	createListOfAllPossibleMoves(ML),
	findall(line3(vertical,X,Y),( member(move(vertical,X,Y),ML),
				      line3VerticalAtXYasTopLeftCorner(X,Y,1);
				      line3VerticalAtXYasTopRightCorner(X,Y,1) ),
		Line3_vList).

%check if he can close a square this turn.
% and choose this line!!
chooseMoveForHardAI(W):-
	closeSquaresList(CloseList),
	length(CloseList,Len),
	Len\=0,
	Index is random(Len)+1,
	nth1(Index,CloseList,close(Dir,X,Y)),
	makeAIMove(W,Dir,X,Y).
%check if there is a line that if he choose it,
%the human player will close a square,
% and choose another line!!
chooseMoveForHardAI(W):-
	not_line3List(Not_line3List),
	length(Not_line3List,Len),
	Len\=0,
	Index is random(Len)+1,
	nth1(Index,Not_line3List,not_line3(LineType,X,Y)),
	makeAIMove(W,LineType,X,Y).
%else- random a move.
chooseMoveForHardAI(W):-
	createListOfAllPossibleMoves(ML),
	length(ML,Len),
	Index is random(Len)+1,
	nth1(Index,ML,move(Dir,X,Y)),
	makeAIMove(W,Dir,X,Y).




%make the comuter move according to the line that chosen.
makeAIMove(W,horizontal,X,Y):-
	hLinePressed(W,X,Y).

makeAIMove(W,vertical,X,Y):-
	vLinePressed(W,X,Y).


%%%%playMove(W)%%%%
%doing the computer move according to the gameType.
playMove(W):-
	send(timer(0.3), delay),
	players(PlayersList),
	writeln(['playmove - the players : ',PlayersList]),
%	players([p(GameType, Score, Color)|_]),
	players([p(aiEasy,_,_)|_]),
	chooseMoveForEasyAI(W).

playMove(W):-
	send(timer(0.3), delay),
	players(PlayersList),
	writeln(['playmove - the players : ',PlayersList]),
%	players([p(GameType, Score, Color)|_]),
	players([p(aiHard,_,_)|_]),
	chooseMoveForHardAI(W).

playMove(_).
	%player human.
        %do nothing - wait for press ....



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%% init facts of game %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%init all the dynamic lists in the game.
initGame:-
	retractall(pointsList(_)),
	retractall(players(_)),
	retractall(squaresList(_)),
	assert(squaresList([])),
	assert(players([])),
	assert(pointsList([])),
	listPoints.

%init the points list.
listPoints:-
	findall(p((X,Y),Up,Down,Right,Left),p((X,Y),Up,Down,Right,Left),L),
	retract(pointsList(_)),
	assert(pointsList(L)).


%initPlayers(GameType)
%init the Players list according to the GameType- the player choose.
initPlayers(humanfthuman):-
%	type , score, signColor
	retract(players(_)),
	append([p(human,0,red)],[p(human,0,green)],PlayersList),
	assert(players(PlayersList)).

initPlayers(humanftcomputer_easy):-
%	type , score, signColor
	retract(players(_)),
	append([p(aiEasy,0,red)],[p(human,0,green)],PlayersList),
	assert(players(PlayersList)).

initPlayers(humanftcomputer_hard):-
%	type , score, signColor
	retract(players(_)),
	append([p(aiHard,0,red)],[p(human,0,green)],PlayersList),
	assert(players(PlayersList)).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%% show the facts on the board %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%someone just closed a square- put a red square in this place.
showSingleSquare(W,X,Y,red):-
	new(Xg,bitmap('Xred.bmp')),
	LocX is 188 + (X-1) * 75,
	LocY is 258 + (Y-1) * 75,
	send(W,display,Xg,point(LocX,LocY)).
%someone just closed a square- put a green square in this place.
showSingleSquare(W,X,Y,green):-
	new(Xr,bitmap('Xgreen.bmp')),
	LocX is 188 + (X-1) * 75,
	LocY is 258 + (Y-1) * 75,
	send(W,display,Xr,point(LocX,LocY)).

%no one closed a square in this turn
showSquares(_,[]).
%someone just closed a square, check if the game end.
showSquares(W,[sq(X,Y,Sign)|RestOfSquares]):-
	showSingleSquare(W,X,Y,Sign),
	showSquares(W,RestOfSquares),
	endGame(W).


%show the scores of the players in this turn
showScores(W):-
	players(PlayersList),
	writeln(PlayersList),
	member(p(_,ScoreRed,red),PlayersList),
	member(p(_,ScoreGreen,green),PlayersList),
     	showScoresBoxesRed(W,ScoreRed),
	showScoresBoxesGreen(W,ScoreGreen),
	squaresList(SquaresList),
	writeln(SquaresList).

%put the appropriate picture to the red scores in this turn.
showScoresBoxesRed(W,ScoreRed):-
	scoreRed(ScoreRed,Pic),
	new(S,bitmap(Pic)),
	send(W,display,S,point(665,300)).
%put the appropriate picture to the green scores in this turn.
showScoresBoxesGreen(W,ScoreGreen):-
	scoreGreen(ScoreGreen,Pic),
	new(S,bitmap(Pic)),
	send(W,display,S,point(665,375)).


%put the name of the player -player1/2, that his turn is now.
showPlayerTurn(W):-
	players(PlayersList),
	nth1(1,PlayersList,p(_,_,Sign)),
	showPlayerTurn1(W,Sign).

showPlayerTurn1(W,red):-
	new(Ba,bitmap('player1red.bmp')),
	send(W,display,Ba,point(435,76)).

showPlayerTurn1(W,green):-
	new(Ba,bitmap('player2green.bmp')),
	send(W,display,Ba,point(435,76)).


%the game is not finish in this turn.
endGame(_):-
       	totalScore(Total),
	Total \= 25.

%the game is finish in this turn.
endGame(W):-
	totalScore(Total),
	Total is 25,
	winner(W).

%check who is the winner and put the appropriate player name.
winner(W):-
       	players(PL),
	nth1(1,PL,p(_,S1,green)),
	nth1(2,PL,p(_,S2,red)),
	S1>S2,
	new(D,bitmap('player2Win.bmp')),
	send(W,display,D,point(237,155)).

winner(W):-
       	players(PL),
	nth1(1,PL,p(_,S1,red)),
	nth1(2,PL,p(_,S2,green)),
	S1>S2,
	new(D,bitmap('player1Win.bmp')),
	send(W,display,D,point(237,155)).

winner(W):-
       	players(PL),
      	nth1(1,PL,p(_,S1,green)),
	nth1(2,PL,p(_,S2,red)),
	S2>S1,
	new(D,bitmap('player1Win.bmp')),
	send(W,display,D,point(237,155)).

winner(W):-
       	players(PL),
      	nth1(1,PL,p(_,S1,red)),
	nth1(2,PL,p(_,S2,green)),
	S2>S1,
	new(D,bitmap('player2Win.bmp')),
	send(W,display,D,point(237,155)).




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%% draw the board game %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%add all the points to the board.
addPointsToBored(_,7).
addPointsToBored(W,Line):-
	putPoints(W,1,Line),
	NewLine is Line + 1,
	addPointsToBored(W,NewLine).

%put one point on the board.
drawPoint(W,X,Y):-
       	LocX is 172 + (X-1) * 75,
	LocY is 241 + (Y-1) * 75,
	new(P,bitmap('dot.bmp')),
	send(W,display,P,point(LocX,LocY)).

putPoints(_,7,_).
putPoints(W,X,Y):-
	pointsList(PointsList),
	member(p((X,Y),_,_,_,_),PointsList),
	drawPoint(W,X,Y),
	NewX is X + 1,
	putPoints(W,NewX,Y).



%draw the horizontal lines on the board- till line 7.
drawHLines(_,7).
drawHLines(W,Line):-
	putHorizontalLines(W,1,Line),
	NewLine is Line + 1,
	drawHLines(W,NewLine).

%draw the horizontal lines on the board- till queue 6.
putHorizontalLines(_,6,_).
putHorizontalLines(W,X,Y):-
	pointsList(PointsList),
	member(p((X,Y),_,_,LineStatus,_),PointsList),
	drawHLine(W,X,Y,LineStatus),
	NewX is X + 1,
	putHorizontalLines(W,NewX,Y).

% 0 means a gray line - no one chose this line yet ....
% make the lines pressed- if someone will press them
% the hLinePressed action will be work.
drawHLine(W,X,Y,0):-
	LocX is 188 + (X-1) * 75,
	LocY is 245 + (Y-1) * 75,
	new(B,bitmap('widthLine_gray.bmp')),
	send(W,display,B,point(LocX,LocY)),
	send(B,recogniser,click_gesture(left,'',single,
	     and(message(@prolog,hLinePressed,W,X,Y)))).

% 1 means a red\green line - someone already chose this line ....
drawHLine(W,X,Y,1):-
	players(PlayersList),
	nth1(1,PlayersList,p(_,_,SignColor)),
	drawHLineColor(W,X,Y,1,SignColor).

drawHLineColor(W,X,Y,1,red):-
	LocX is 188 + (X-1) * 75,
	LocY is 245 + (Y-1) * 75,
	new(B,bitmap('widthLine_red.bmp')),
	send(W,display,B,point(LocX,LocY)).

drawHLineColor(W,X,Y,1,green):-
       	LocX is 188 + (X-1) * 75,
	LocY is 245 + (Y-1) * 75,
	new(B,bitmap('widthLine_green.bmp')),
	send(W,display,B,point(LocX,LocY)).

%someone just pressed on horizontal line.
hLinePressed(W,X,Y):-
       	%check:
	append([X],[Y],Z),
        writeln(Z),
	%
	pointsList(PointsList),
	member(p((X,Y),Up,Down,0,Left),PointsList),
	XPlus1 is X+1,
	member(p((XPlus1,Y),Up1,Down1,Right1,0),PointsList),
	select(p((X,Y),Up,Down,0,Left),PointsList,NL),
        select(p((XPlus1,Y),Up1,Down1,Right1,0),NL,NL2),
	append([p((X,Y),Up,Down,1,Left)],NL2,NL3),
	append([p((XPlus1,Y),Up1,Down1,Right1,1)],
	       NL3,NewPointsList),
	retract(pointsList(_)),
	assert(pointsList(NewPointsList)),
	member(p((X,Y),_,_,LineStatus,_),NewPointsList),
	drawHLine(W,X,Y,LineStatus),
	totalScoreForHorizontalLine(X,Y,Score),
	playTurn(Score),
	showPlayerTurn(W),
	showScores(W),
       	squaresList(FullSquaresList),
	showSquares(W,FullSquaresList),
        playMove(W).

%draw the vertical lines on the board- till line 6.
drawVLines(_,6).
drawVLines(W,Line):-
	putVerticalLines(W,1,Line),
	NewLine is Line + 1,
	drawVLines(W,NewLine).

%draw the vertical lines on the board- till queue 6.
putVerticalLines(_,7,_).
putVerticalLines(W,X,Y):-
	pointsList(PointsList),
	member(p((X,Y),_,LineStatus,_,_),PointsList),
	drawVLine(W,X,Y,LineStatus),
	NewX is X + 1,
	putVerticalLines(W,NewX,Y).

% 0 means a gray line - no one chose this line yet ....
% make the lines pressed- if someone will press them
% the vLinePressed action will be work.
drawVLine(W,X,Y,0):-
	LocX is 175 + (X-1) * 75,
	LocY is 257 + (Y-1) * 75,
	new(B,bitmap('hightLine_gray.bmp')),
	send(W,display,B,point(LocX,LocY)),
	send(B,recogniser,click_gesture(left,'',single,
	     and(message(@prolog,vLinePressed,W,X,Y)))).

% 1 means a red\green line - someone already chose this line ....
drawVLine(W,X,Y,1):-
	players(PlayersList),
	nth1(1,PlayersList,p(_,_,SignColor)),
	drawVLineColor(W,X,Y,1,SignColor).

drawVLineColor(W,X,Y,1,red):-
	LocX is 175 + (X-1) * 75,
	LocY is 257 + (Y-1) * 75,
	new(B,bitmap('hightLine_red.bmp')),
	send(W,display,B,point(LocX,LocY)).

drawVLineColor(W,X,Y,1,green):-
       	LocX is 175 + (X-1) * 75,
	LocY is 257 + (Y-1) * 75,
	new(B,bitmap('hightLine_green.bmp')),
	send(W,display,B,point(LocX,LocY)).


%someone just pressed on vertical line.
vLinePressed(W,X,Y):-
	%check:
	append([X],[Y],Z),
        writeln(Z),
	%
	pointsList(PointsList),
       	member(p((X,Y),Up,0,Right,Left),PointsList),
	YPlus1 is Y+1,
       	member(p((X,YPlus1),0,Down1,Right1,Left1),PointsList),
	select(p((X,Y),Up,0,Right,Left),PointsList,NL),
        select(p((X,YPlus1),0,Down1,Right1,Left1),NL,NL2),
	append([p((X,Y),Up,1,Right,Left)],NL2,NL3),
	append([p((X,YPlus1),1,Down1,Right1,Left1)],
	       NL3,NewPointsList),
	retract(pointsList(_)),
	assert(pointsList(NewPointsList)),
	member(p((X,Y),_,LineStatus,_,_),NewPointsList),
	drawVLine(W,X,Y,LineStatus),
	totalScoreForVerticalLine(X,Y,Score),
	playTurn(Score),
      	showPlayerTurn(W),
      	showScores(W),
      	squaresList(FullSquaresList),
	showSquares(W,FullSquaresList),
        playMove(W).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%% calculate the scores and the squares %%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% retuen the score
% Score will be 1 if the square is closed and 0 if not.
checkFullSquareAtXYasTopLeftCorner(X,Y,Score):-
	pointsList(PointsList),
	member(p((X,Y),_,1,1,_),PointsList),
	XPlus1 is X+1,
	YPlus1 is Y+1,
	member(p((XPlus1,YPlus1),1,_,_,1),PointsList),
	Score is 1.
checkFullSquareAtXYasTopLeftCorner(_,_,0).

%no one closed a square in this turn - do nothing.
addToFullSquareList(_,_,0).
%someone just closed a square - add to the squres list that square.
addToFullSquareList(X,Y,1):-
	players(PlayersList),
	nth1(1,PlayersList,p(_ , _, SignColor)),
	squaresList(OldSquareList),
       	append([sq(X,Y,SignColor)],OldSquareList,NewSquareList),
	retract(squaresList(_)),
	assert(squaresList(NewSquareList)).


%if someone just closed a square - add to the squres list that square,
%else- do nothing.
%and return the Total- the scores that need to be add.

%if someone press on Horizontal line.
totalScoreForHorizontalLine(X,Y,Total):-
	checkFullSquareAtXYasTopLeftCorner(X,Y,Score1),
	addToFullSquareList(X,Y,Score1),
	YMinus1 is Y - 1,
	checkFullSquareAtXYasTopLeftCorner(X,YMinus1,Score2),
	addToFullSquareList(X,YMinus1,Score2),
	Total is Score1 + Score2.
%if someone press on vertical line.
totalScoreForVerticalLine(X,Y,Total):-
	checkFullSquareAtXYasTopLeftCorner(X,Y,Score1),
	addToFullSquareList(X,Y,Score1),
	XMinus1 is X - 1,
	checkFullSquareAtXYasTopLeftCorner(XMinus1,Y,Score2),
	addToFullSquareList(XMinus1,Y,Score2),
	Total is Score1 + Score2.



%calculate the total Scores = the num of squares
%of player1+player2 together.
totalScore(Total):-
	players(PL),
	nth1(1,PL,p(_,S1,_)),
	nth1(2,PL,p(_,S2,_)),
	Total is S1+S2.



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% Main game - handle single turn functions %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%no one close a square - just switch the players turn.
playTurn(0):-
	players(PlayersList),
	reverse(PlayersList,NewPlayersList),
	retract(players(_)),
	assert(players(NewPlayersList)).

%someone just closed a square !!!
%switch the players turn and updating the score of this player.
playTurn(Score):-
	players(PlayersList),
	nth1(1,PlayersList,p(PlayerType1 , Score1, SignColor1)),
	nth1(2,PlayersList,P2),
	NewScore is Score1 + Score,
	retract(players(_)),
	append([p(PlayerType1, NewScore ,SignColor1 )],[P2],NewPlayersList),
	assert(players(NewPlayersList)).


