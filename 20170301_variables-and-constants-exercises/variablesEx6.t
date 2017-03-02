% Keisun Wu
% 20170301
% 6a) Ask for position and size of rectangle (pixel) and draw it

var length1, width1, x, y : int

put "Input the width (horizontal sides) of rectangle: " ..
get width1
put "Input the length (vertical sides) of rectangle: " ..
get length1
put "Input the x coordinate of the bottom left corner: " ..
get x
put "Input the y coordinate of the bottom left corner: " ..
get y

cls
drawbox (x, y, x + width1, y + length1, black)
