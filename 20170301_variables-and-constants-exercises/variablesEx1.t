% Keisun Wu
% 20170301
% 1) Convert inches to centimeters

const INCHTOCM : real := 2.54
var lengthInch, lengthCm : real

put "What is the length of the desk? (in inches)"
get lengthInch
lengthCm := lengthInch * INCHTOCM

put skip
put "The length of the desk is ", lengthCm : 0 : 2, " cm."
