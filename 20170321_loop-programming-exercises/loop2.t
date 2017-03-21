% Keisun Wu
% 20170321
% 2. Generate a number's multiplication table from 1 to 12

var num : int
put "Enter a number: " ..
get num

for i : 1 .. 12
    put i : 2, " x ", num, " = ", i * num
end for

