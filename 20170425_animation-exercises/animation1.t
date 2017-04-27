/* Keisun Wu
 * 20170425
 * 1. Bouncing ball
 */

View.Set ("offscreenonly")
var x : int := maxx div 2
var y : int := maxy div 2
var radius : int := 50
var direction : int := -5

loop
    drawfilloval (x, y, radius, radius, black)
    View.Update
    delay (20)
    cls
    if y - radius <= 0 or y + radius >= maxy then
	direction *= -1
    end if
    y += direction
end loop
