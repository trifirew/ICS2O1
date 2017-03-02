% Keisun Wu
% 20170301
% 5) Ask for student's name, marks and calculate the average mark.

var name : string
var mark1, mark2, mark3, mark4, mark5 : real
var full1, full2, full3, full4, full5 : real
var percent1, percent2, percent3, percent4, percent5 : real
var average : real

put "What's your name?"
get name : *
put skip
put "What mark did you get at your first test?"
get mark1
put "What is your first test mark out of?"
get full1
put "What mark did you get at your second test?"
get mark2
put "What is your second test mark out of?"
get full2
put "What mark did you get at your third test?"
get mark3
put "What is your third test mark out of?"
get full3
put "What mark did you get at your fourth test?"
get mark4
put "What is your fourth test mark out of?"
get full4
put "What mark did you get at your fifth test?"
get mark5
put "What is your fifth test mark out of?"
get full5

percent1 := mark1 / full1 * 100
percent2 := mark2 / full2 * 100
percent3 := mark3 / full3 * 100
percent4 := mark4 / full4 * 100
percent5 := mark5 / full5 * 100
average := (percent1 + percent2 + percent3 + percent4 + percent5) / 5

put "Your name is ", name, "."
put "You get ", percent1 : 0 : 1, " percent in your first test."
put "You get ", percent2 : 0 : 1, " percent in your second test."
put "You get ", percent3 : 0 : 1, " percent in your third test."
put "You get ", percent4 : 0 : 1, " percent in your fourth test."
put "You get ", percent5 : 0 : 1, " percent in your fifth test."
put "Your average mark is ", average : 0 : 1, " percent."
