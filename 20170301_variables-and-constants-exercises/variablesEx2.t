% Keisun Wu
% 20170301
% 2) Ask for your year of birth, and output your age

var birth, currentYear, age : int

put "What is your year of birth?"
get birth
put "What year is it now?"
get currentYear
age := currentYear - birth

put skip
put "You are now ", age, " year(s) old."
