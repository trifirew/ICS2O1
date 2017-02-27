% Estate Tycoon
% By Keisun
% Inspired by: Monopoly Board Game

import GUI

var gameMenu : int
var menuItem : array 1 .. 1 of int
var menuItemLabel : array 1 .. 1 of string :=
    init ("Quit")

View.Set ("graphics:801;601,position:center;middle,nobuttonbar")


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

% Create menus
gameMenu := GUI.CreateMenu ("Game")
menuItem(1) := GUI.CreateMenuItem(menuItemLabel(1), GUI.Quit)

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
    put blocks (i) -> id, " ", blocks (i) -> name
end for

% Initialize the players
var players : array 1 .. 4 of pointer to Player
for i : 1 .. 4    
get name : *
    new Player, players (i)
    players (i) -> initPlayer (name)
end for


proc main
    for i : 1 .. upper (players)
	if players (i) -> arrested = 0 then
	    put "It's ", players (i) -> name, " 's turn."
	    % TODO: Player action
	else
	    players (i) -> stayInJail
	end if
    end for
end main

main
main
main
