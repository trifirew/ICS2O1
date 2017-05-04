var x, y, bn, bud : int
var oldX, oldY : int
loop
    buttonwait ("down", x, y, bn, bud)
    drawdot (x, y, black)
    oldX := x
    oldY := y
    buttonwait ("down", x, y, bn, bud)
    drawfillbox (oldX, oldY, x, y, Rand.Int (1, 255))
end loop
