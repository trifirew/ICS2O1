% Keisun Wu
% 20170321
% 6. Guess a random number between 1 and 10
%    After each guess, tell the user whether the guess was too high or too low

var num, guess : int
randint (num, 1, 10)

loop
    put "Guess a number between 1 and 10: " ..
    get guess
    if guess > num then
	put "TOO HIGH"
    elsif guess < num then
	put "TOO LOW"
    else
	exit
    end if
end loop
put "YOU ARE RIGHT!"
