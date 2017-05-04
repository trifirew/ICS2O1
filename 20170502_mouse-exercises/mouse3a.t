View.Set ("offscreenonly")
var x, y, b, bn, bud : int
type rectangle :
    record
	x1, y1, x2, y2, c : int
    end record
var boxes : flexible array 1 .. 0 of rectangle

fcn u : int
    % Shortcut for the last item index in an array
    result upper (boxes)
end u

proc drawPrevious (upperEnd : int)
    % Re-draw previous drawn rectangles
    var box : rectangle
    for i : 1 .. upperEnd
	box := boxes (i)
	drawfillbox (box.x1, box.y1, box.x2, box.y2, box.c)
    end for
end drawPrevious

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
	View.Update
    end loop
    boxes (u).x2 := x
    boxes (u).y2 := y
    boxes (u).c := Rand.Int (1, 255)
    cls
    drawPrevious (u)
    View.Update
end loop
