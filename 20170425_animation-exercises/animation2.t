/* Keisun Wu
 * 20170426
 * 2. Two people facing each other, and throwing paper planes at each other
 */

View.Set ("offscreenonly")
var x, y, l, w, move : int
var keys : array char of boolean
x := -100
y := -100
l := 40
w := 20
move := 0

drawfilloval (50, 100, 25, 25, blue)
drawfillbox (40, 0, 60, 75, blue)
drawfilloval (maxx - 50, 100, 25, 25, red)
drawfillbox (maxx - 40, 0, maxx - 60, 75, red)
View.Update
loop
    Input.KeyDown (keys)
    if x < 0 or x > maxx then
	if keys (KEY_RIGHT_ARROW) then
	    x := 100
	    y := 150
	    move := 5
	elsif keys (KEY_LEFT_ARROW) then
	    x := maxx - l - 100
	    y := 150
	    move := -5
	end if
    end if
    drawfillbox (x, y, x + l, y + w, black)
    View.UpdateArea (0, 150, maxx, 200)
    delay (20)
    cls
    x += move
end loop
