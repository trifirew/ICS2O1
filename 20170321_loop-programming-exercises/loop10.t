/* Keisun Wu
 * 20170321
 * 10. Guess a random number between 1 and 10
 *     After each guess, tell the user whether the guess was too high or too low
 *     Count the number of attempts
 */

var num, guess : int
var count : int := 0
randint (num, 1, 10)

loop
    put "Guess a number between 1 and 10: " ..
    get guess
    count := count + 1
    exit when guess = num
    if guess > num then
	put "TOO HIGH"
    else
	put "TOO LOW"
    end if
end loop
put "You've guessed for ", count, " times and finally reached the right answer!"
