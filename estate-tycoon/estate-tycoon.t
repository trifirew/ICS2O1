% Estate Tycoon
% By Keisun
% Inspired by: Monopoly Board Game

import GUI
% Set window mode
View.Set ("graphics:800;600,position:center;middle,nobuttonbar")
View.Set ("title:Estate Tycoon")


class Block
    % Class of in-game blocks
    export name, setBlock
    var name : string := ""

    proc setBlock (setName : string)
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

% Not game-related variables
var mouseX, mouseY, mouseBtn : int                              % Related with mouse events
var imgBanner, imgStartS, imgStartL, imgExitS, imgExitL : int   % All image assets
var picBanner, picStart, picExit, labelNewGame : int                          % All GUI widgets
var cboxPlayer, txtfieldPlayer : array 1 .. 4 of int
% Game-related variables
var blocks : array 0 .. 35 of pointer to Block
var players : array 1 .. 4 of pointer to Player
var defPlayerName : array 1 .. 4 of string :=
    init ("Player 1 (You)",
    "Player 2 (CPU)",
    "Player 3 (CPU)",
    "Player 4 (CPU)")

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

proc cboxStatus (status : boolean)
    for i : 3 .. 4
	if GUI.GetEventWidgetID = cboxPlayer (i) then
	    if status then
		GUI.Enable (txtfieldPlayer (i))
		GUI.SetText (txtfieldPlayer (i), defPlayerName (i))
	    else
		GUI.SetText (txtfieldPlayer (i), "")
		GUI.Disable (txtfieldPlayer (i))
	    end if
	end if
    end for
end cboxStatus
proc txtfieldStatus (text : string)
end txtfieldStatus
% Start a new game UI
proc newGame
    cls
    for i : 1 .. 4
	cboxPlayer (i) := GUI.CreateCheckBox (300, 350 - i * 50, defPlayerName (i), cboxStatus)
	txtfieldPlayer (i) := GUI.CreateTextField (400, 350 - i * 50, 100, "", txtfieldStatus)
    end for
    GUI.SetCheckBox (cboxPlayer (1), true)
    GUI.Enable (txtfieldPlayer (1))
    GUI.Disable (cboxPlayer (1))
    GUI.Disable (cboxPlayer (2))
    GUI.SetCheckBox (cboxPlayer (2), true)
    GUI.SetText (txtfieldPlayer (2), defPlayerName (2))
    GUI.Enable (txtfieldPlayer (2))
    GUI.Enable (cboxPlayer (3))
    GUI.Disable (txtfieldPlayer (3))
    GUI.Enable (cboxPlayer (4))
    GUI.Disable (txtfieldPlayer (3))
    loop
	exit when GUI.ProcessEvent
    end loop
end newGame

% Main menu UI
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
		newGame
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


% Initialize the blocks
var blocksInfo : int
var id : int
var name : string
open : blocksInfo, "assets/blocks.txt", get
for i : 0 .. 35
    get : blocksInfo, id
    get : blocksInfo, name : *
    new Block, blocks (i)
    blocks (i) -> setBlock (name)
end for
% Initialize the players
for i : 1 .. 4
    get name : *
    new Player, players (i)
    players (i) -> initPlayer (name)
end for


mainMenu
