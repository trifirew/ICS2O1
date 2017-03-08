% Keisun Wu
% 20170308
% 1) Decide if an integer is even, odd, or zero.

var num : int
put "Enter an INTEGER: " ..
get num
if num = 0 then
    put "ZERO"
elsif num mod 2 = 0 then
    put "EVEN"
else
    put "ODD"
end if
