% Keisun Wu
% 20170321
% 4. Conversion table from miles to kilometres
%    Starting value, ending value, and increments can be specified

setscreen ("text")
var starting, ending, increments : int
put "Enter starting value of conversion table: " ..
get starting
put "Enter ending value of conversion table: " ..
get ending
put "Enter increments of conversion table: " ..
get increments
put ""

put "MILES", "" : 17, "KILOMETERS"
put ""
for mile : starting .. ending by increments
    put mile : 3, "" : 20, mile * 1.6 : 5 : 1
end for
