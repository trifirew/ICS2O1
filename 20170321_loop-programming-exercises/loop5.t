/* Keisun Wu
 * 20170322
 * 5. Guess a random number between 1 and 10
 */

var num, guess : int
randint (num, 1, 10)

put "Guess a number between 1 and 10: " ..
loop
    get guess
    if guess < 1 or guess > 10 then
	put "Invalid number, enter again: " ..
    elsif guess = num then
	exit
    else
	put "Wrong! Guess again: " ..
    end if
end loop
put "You got it right!"
