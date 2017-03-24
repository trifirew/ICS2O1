/* Keisun Wu
 * 20170322
 * 10. Guess a random number between 1 and 10
 *     After each guess, tell the user whether the guess was too high or too low
 *     Count the number of attempts
 */

var num, guess : int
var count : int := 0
num := Rand.Int (1, 10)

put "Guess a number between 1 and 10: " ..
loop
    get guess
    if guess < 1 or guess > 10 then
	put "Invalid number, enter again: " ..
    elsif guess > num then
	count := count + 1
	put "Too high! Guess again: " ..
    elsif guess < num then
	count := count + 1
	put "Too low! Guess again: " ..
    else
	count := count + 1
	exit
    end if
end loop
put "You've guessed for ", count, " times and finally reached the right answer!"
