/* Keisun Wu
 * 20170321
 * 9. Calculate the average of 10 scores
 */

var score, avg : real
var sum : real := 0

for i : 1 .. 10
    put "Enter score ", i, ": " ..
    get score
    sum := sum + score
end for
avg := sum / 10
put "The average is ", avg, "."
