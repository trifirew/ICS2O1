% Estate Tycoon
% By Keisun
% Inspired by: Monopoly Board Game

import GUI

var imgBanner, imgStartS, imgStartL, imgExitS, imgExitL : int   % All image assets
var picBanner, picStart, picExit : int                          % All GUI widgets
var mouseX, mouseY, mouseBtn : int                              % Related with mouse events

% Set window mode
View.Set ("graphics:800;600,position:center;middle,nobuttonbar")
View.Set ("title:Estate Tycoon")

class Block
    % Class of in-game blocks
    export id, name, setBlock

    var id : int := 0
    var name : string := ""

    proc setBlock (setID : int, setName : string)
	id := setID
	name := setName
    end setBlock
end Block

class Player
    % Class of players
    export name, location, money, arrested,
	initPlayer, move, stayInJail
    var name : string := "Player"
    var location : int := 0
    var money : int := 0
    var arrested : int := 0

    proc initPlayer (setName : string)
	name := setName
	location := 0
	money := 13700
	arrested := 0
    end initPlayer

    proc move (step : int)
	for i : 1 .. step
	    location += 1
	    if location = 36 then
		location := 0
	    end if
	    % TODO: Move the symbol of character on screen
	end for
	put location
    end move

    proc stayInJail
	put "You are arrested. You need to wait for ",
	    arrested,
	    " round(s)."
	arrested := arrested - 1
    end stayInJail
end Player


% Initialize the blocks
var blocks : array 0 .. 35 of pointer to Block
var blocksInfo : int
var id : int
var name : string
open : blocksInfo, "assets/blocks.txt", get
for i : 0 .. 35
    get : blocksInfo, id
    get : blocksInfo, name : *
    new Block, blocks (i)
    blocks (i) -> setBlock (i, name)
end for

% Initialize the players
var players : array 1 .. 4 of pointer to Player
for i : 1 .. 4
    get name : *
    new Player, players (i)
    players (i) -> initPlayer (name)
end for


proc game
    for i : 1 .. upper (players)
	if players (i) -> arrested = 0 then
	    put "It's ", players (i) -> name, " 's turn."
	    % TODO: Player action
	else
	    players (i) -> stayInJail
	end if
    end for
end game

% Main menu
proc mainMenu
    imgBanner := Pic.FileNew ("assets/banner.jpg")
    imgStartS := Pic.FileNew ("assets/start_s.jpg")
    imgStartL := Pic.FileNew ("assets/start_l.jpg")
    imgExitS := Pic.FileNew ("assets/exit_s.jpg")
    imgExitL := Pic.FileNew ("assets/exit_l.jpg")
    picBanner := GUI.CreatePicture (0, 400, imgBanner, false)
    picStart := GUI.CreatePicture (300, 275, imgStartS, false)
    picExit := GUI.CreatePicture (300, 225, imgExitS, false)
    loop
	Mouse.Where (mouseX, mouseY, mouseBtn)
	if mouseX > 300 and mouseX < 500 and mouseY > 275 and mouseY < 325 then
	    picStart := GUI.CreatePicture (300, 275, imgStartL, false)
	    picExit := GUI.CreatePicture (300, 225, imgExitS, false)
	    if mouseBtn not= 0 then
		game
		exit
	    end if
	elsif mouseX > 300 and mouseX < 500 and mouseY > 225 and mouseY < 275 then
	    picStart := GUI.CreatePicture (300, 275, imgStartS, false)
	    picExit := GUI.CreatePicture (300, 225, imgExitL, false)
	    if mouseBtn not= 0 then
		cls
		GUI.Quit
		exit
	    end if
	else
	    picStart := GUI.CreatePicture (300, 275, imgStartS, false)
	    picExit := GUI.CreatePicture (300, 225, imgExitS, false)
	end if
    end loop
end mainMenu

mainMenu
