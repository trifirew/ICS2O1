/* Keisun Wu
 * 20170321
 * 6. Guess a random number between 1 and 10
 *    After each guess, tell the user whether the guess was too high or too low
 */

var num, guess : int
randint (num, 1, 10)

put "Guess a number between 1 and 10: " ..
loop
    get guess
    if guess < 1 or guess > 10 then
	put "Invalid number, enter again: " ..
    elsif guess > num then
	put "Too high! Guess again: " ..
    elsif guess < num then
	put "Too low! Guess again: " ..
    else
	exit
    end if
end loop
put "YOU ARE RIGHT!"
