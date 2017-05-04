View.Set ("offscreenonly")
var x, y, b, bn, bud : int
var x1, y1 : int

loop
    buttonwait ("down", x, y, bn, bud)
    x1 := x
    y1 := y
    loop
	mousewhere (x, y, b)
	exit when b = 0
	cls
	drawbox (x1, y1, x, y, black)
	View.UpdateArea (x1, y1, x, y)
    end loop
    buttonwait ("up", x, y, bn, bud)
    drawfillbox (x1, y1, x, y, Rand.Int (1, 255))
    View.UpdateArea (x1, y1, x, y)
end loop
