% Keisun Wu
% 20170301
% 3) Ask for first name and last name, output in "last name, first name" form

var lastName, firstName : string

put "What is your first name?"
get firstName : *
put "What is your last name?"
get lastName

put skip
put "Your name is"
put lastName, ", ", firstName
