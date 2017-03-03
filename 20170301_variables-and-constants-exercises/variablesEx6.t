% Keisun Wu
% 20170301
% 6) Ask for position and size of rectangle (pixel) and draw it

var length1, width1, x1, y1, x2, y2, area, peri : int

put "Input the width (horizontal sides) of rectangle: " ..
get width1
put "Input the length (vertical sides) of rectangle: " ..
get length1
put "Input the x coordinate of the bottom left corner: " ..
get x1
put "Input the y coordinate of the bottom left corner: " ..
get y1

% Calculate for the top right corner
x2 := x1 + width1
y2 := y1 + length1
% Calculate area and perimeter
area := width1 * length1
peri := 2 * (width1 + length1)

cls
locatexy (x1 + width1 div 2, y2+15)
put width1
locatexy (x1 - 30, y1 + length1 div 2)
put length1
locatexy(x1 + width1 div 2 - 35, y1 + length1 div 2+10)
put "Area = ", area:0:1
locatexy(x1 + width1 div 2 - 50, y1 + length1 div 2-10)
put "Perimeter = ", peri:0:1
drawbox (x1, y1, x2, y2, black)
