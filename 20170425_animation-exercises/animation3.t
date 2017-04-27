/* Keisun Wu
 * 20170427
 * 3. Move Android with arrow key
 */

View.Set ("graphics:1024;768,offscreenonly")
var keys : array char of boolean
var droidX : int := maxx - 180
var droidY : int := maxy - 180
var droidMove : int := 4
var appleX : int := 0
var appleY : int := 0
var appleMove : int := 3
var appleDirHori : int := 1
var appleDirVert : int := 1
var picDroid : int := Pic.FileNew ("android.gif")
var picApple : int := Pic.FileNew ("apple.gif")


% process Ball
%     var x : int := maxx div 2
%     var y : int := maxy div 2
%     var radius : int := 50
%     var direction : int := -5
%     loop
%         drawfilloval (x, y, radius, radius, red)
%         % View.Update
%         View.UpdateArea (x - radius, y - radius - move, x+ radius, y + radius + move)
%         delay (20)
%         cls
%         if y - radius <= 0 or y + radius >= maxy then
%             direction *= -1
%         end if
%         y += direction
%     end loop
% end Ball


process apple
    loop
	appleDirHori := Rand.Int (0, 2)
	appleDirVert := Rand.Int (0, 2)
	delay (500)
    end loop
end apple

fork apple
loop
    Input.KeyDown (keys)
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

    % Computer control
    % if appleDirVert = 1 and appleY + 180 < maxy then
    %     appleY += appleMove
    % elsif appleDirVert = 2 and appleY > 0 then
    %     appleY -= appleMove
    % end if
    % if appleDirHori = 1 and appleX > 0 then
    %     appleX -= appleMove
    % elsif appleDirHori = 2 and appleX + 180 < maxx then
    %     appleX += appleMove
    % end if

    % Second user control
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

    Pic.Draw (picApple, appleX, appleY, picMerge)
    Pic.Draw (picDroid, droidX, droidY, picMerge)

    View.Update
    % View.UpdateArea (x -move, y - move, x + 180 +move, y +180+ move)
    delay (5)
    cls
end loop
