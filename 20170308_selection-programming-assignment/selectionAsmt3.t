% Keisun Wu
% 20170308
% 3) Determine whether three lengths can form a triangle.

var length1, length2, length3 : real
put "Input the first length: " ..
get length1
assert length1 > 0
put "Input the second length: " ..
get length2
assert length2 > 0
put "Input the third length: " ..
get length3
assert length3 > 0
if length1 + length2 > length3 and
   length1 + length3 > length2 and
   length2 + length3 > length1 then
    put "This three lengths CAN form a triangle."
else
    put "This three lengths CANNOT form a triangle."
end if
