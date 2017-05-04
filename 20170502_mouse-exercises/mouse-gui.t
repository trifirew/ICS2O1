/* Keisun Wu
 * 20170504
 * Mouse-GUI Exercise
 */

import GUI
View.Set ("graphics:800;600,offscreenonly")

type Rectangle :
    record
	x1, y1, x2, y2, c : int
    end record
var x, y, b, bn, bud : int
var oldX, oldY : int
var boxes : flexible array 1 .. 0 of Rectangle
var count : int := 0
var btn1, btn2, btn3, btnExit : int

function u : int
    % Shortcut for the last item index in an array
    result upper (boxes)
end u

procedure drawPrevious (upperEnd : int)
    % Re-draw previous drawn Rectangles
    var box : Rectangle
    for i : 1 .. upperEnd
	box := boxes (i)
	drawfillbox (box.x1, box.y1, box.x2, box.y2, box.c)
    end for
end drawPrevious

procedure mouse1
    cls
    View.Update
    loop
	mousewhere (x, y, b)
	if b = 1 then
	    if count not= 0 then
		loop
		    mousewhere (x, y, b)
		    exit when b = 0
		end loop
		drawline (oldX, oldY, x, y, Rand.Int (1, 255))
		% GUI.Refresh
		View.Update
	    end if
	    count := count + 1
	    oldX := x
	    oldY := y
	end if
    end loop
end mouse1

procedure mouse2
    cls
    View.Update
    loop
	buttonwait ("down", x, y, bn, bud)
	drawdot (x, y, black)
	% GUI.Refresh
	View.Update
	oldX := x
	oldY := y
	buttonwait ("down", x, y, bn, bud)
	drawfillbox (oldX, oldY, x, y, Rand.Int (1, 255))
	% GUI.Refresh
	View.Update
    end loop
end mouse2

procedure mouse3
    cls
    View.Update
    loop
	buttonwait ("down", x, y, bn, bud)
	new boxes, u + 1
	boxes (u).x1 := x
	boxes (u).y1 := y
	loop
	    mousewhere (x, y, b)
	    exit when b = 0
	    cls
	    drawPrevious (u - 1)
	    drawbox (boxes (u).x1, boxes (u).y1, x, y, black)
	    % GUI.Refresh
	    View.Update
	end loop
	boxes (u).x2 := x
	boxes (u).y2 := y
	boxes (u).c := Rand.Int (1, 255)
	cls
	drawPrevious (u)
	% GUI.Refresh
	View.Update
    end loop
end mouse3

btn1 := GUI.CreateButtonFull (300, 200, 200, "mouse1", mouse1, 40, '1', false)
btn2 := GUI.CreateButtonFull (300, 150, 200, "mouse2", mouse2, 40, '2', false)
btn3 := GUI.CreateButtonFull (300, 100, 200, "mouse3", mouse3, 40, '3', false)
btnExit := GUI.CreateButtonFull (300, 50, 200, "Exit", GUI.Quit, 40, 'e', false)
locatexy (345, 400)
put "Mouse Exercises"
View.Update
loop
    exit when GUI.ProcessEvent
end loop

