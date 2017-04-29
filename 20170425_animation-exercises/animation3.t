/* Keisun Wu
 * 20170427
 * 3. Move Android with arrow key
 */

View.Set ("graphics:800;800,offscreenonly")
var keys : array char of boolean
var stop : boolean := false
var droidX : int := maxx - 180
var droidY : int := maxy - 180
var droidMove : int := 4
var appleHuman : boolean := false
var appleX : int := 0
var appleY : int := 0
var appleMove : int := 3
var appleDirHori : int := 1
var appleDirVert : int := 1
var picDroid : int := Pic.FileNew ("android.gif")
var picApple : int := Pic.FileNew ("apple.gif")
var count : int := 0


fcn collide (offset : int) : boolean
    result abs (appleX - droidX) < offset and abs (appleY - droidY) < offset
end collide

process apple
    loop
	exit when stop
	appleDirHori := Rand.Int (0, 2)
	appleDirVert := Rand.Int (0, 2)
	delay (500)
    end loop
end apple

process sfx
    loop
	exit when stop
	if collide (20) then
	    count += 1
	    loop
		Music.Sound (500, 50)
		exit when (not collide (20)) or stop
	    end loop
	    Music.Sound (1000, 50)
	else
	    Music.SoundOff
	end if
    end loop
end sfx

fork apple
fork sfx
Music.PlayFileLoop ("neo.mp3")
loop
    Input.KeyDown (keys)
    % Control moves of Android using ARROW KEYS
    if keys (KEY_UP_ARROW) and droidY + 180 < maxy then
	droidY += droidMove
    elsif keys (KEY_DOWN_ARROW) and droidY > 0 then
	droidY -= droidMove
    end if
    if keys (KEY_LEFT_ARROW) and droidX > 0 then
	droidX -= droidMove
    elsif keys (KEY_RIGHT_ARROW) and droidX + 180 < maxx then
	droidX += droidMove
    end if
    % Set Apple mode (Computer/Human)
    if keys ('h') then
	appleHuman := true
    elsif keys ('g') then
	appleHuman := false
    end if
    % Exit when ESC is pressed
    if keys (KEY_ESC) then
	stop := true
	exit
    end if

    if appleHuman then
	% Second user control moves of Apple using WASD
	if keys ('w') and appleY + 180 < maxy then
	    appleY += appleMove
	elsif keys ('s') and appleY > 0 then
	    appleY -= appleMove
	end if
	if keys ('a') and appleX > 0 then
	    appleX -= appleMove
	elsif keys ('d') and appleX + 180 < maxx then
	    appleX += appleMove
	end if
    else
	% Computer control moves of Apple
	if appleDirVert = 1 and appleY + 180 < maxy then
	    appleY += appleMove
	elsif appleDirVert = 2 and appleY > 0 then
	    appleY -= appleMove
	end if
	if appleDirHori = 1 and appleX > 0 then
	    appleX -= appleMove
	elsif appleDirHori = 2 and appleX + 180 < maxx then
	    appleX += appleMove
	end if
    end if

    locate (1, 1)
    put "Score: ", count
    put "Use ARROW KEYS to control the Android, and try to eat the Apple."
    put "Second user control: " ..
    if appleHuman then
	put "Enabled. Use WASD to control the Apple, and try to keep away from the Android."
	put "Press g to disable second user control."
    else
	put "Disabled. The Apple is automatically controlled by computer."
	put "Press h to enable second user control."
    end if
    put "Press ESC to exit"
    Pic.Draw (picApple, appleX, appleY, picMerge)
    Pic.Draw (picDroid, droidX, droidY, picMerge)
    View.Update
    delay (5)
    cls
end loop
put "Thanks for playing!"
put "Android score: ", count
View.Update
Music.PlayFileStop
Music.SoundOff
for decreasing i : 1000 .. 300 by 100
    Music.Sound (i, 80)
end for
