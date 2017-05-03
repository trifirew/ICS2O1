var x, y, b : int
var oldX, oldY : int
var count : int := 0

loop
    mousewhere (x, y, b)
    if b = 1 then
	if count not= 0 then
	    % loop
	    %     mousewhere (x, y, b)
	    %     exit when b = 0
	    % end loop
	    drawline (oldX, oldY, x, y, black)
	end if
	count := count + 1
	oldX := x
	oldY := y
    end if
end loop
