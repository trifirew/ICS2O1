% Keisun Wu
% 20170321
% 5. Guess a random number between 1 and 10

var num, guess : int
randint (num, 1, 10)

loop
    put "Guess a number between 1 and 10: " ..
    get guess
    exit when guess = num
end loop
put "You got it right!"
