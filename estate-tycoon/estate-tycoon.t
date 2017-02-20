% Estate Tycoon
% By Keisun
% Inspired by: Monopoly Board Game

var location : int := 0

proc move (step : int)
    for i : 1 .. step
	location += 1
	% TODO: Move the symbol of character on screen
    end for
    put location
end move
