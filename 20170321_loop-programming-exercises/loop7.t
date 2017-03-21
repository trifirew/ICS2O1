% Keisun Wu
% 20170321
% 7. Prompt for a series of natural numbers, and display the lowest and highest

var num, lowest, highest : int
lowest := 0
highest := 0
loop
    put "Enter a natural number: "
    get num
    exit when num <= 0
    if lowest = 0 or highest = 0 then
	/* When lowest and highest is not set,
	   the first num will be both the lowest and highest. */
	lowest := num
	highest := num
    end if
    if num < lowest then
	lowest := num
    elsif num > highest then
	highest := num
    end if
end loop
put "LOWEST: ", lowest
put "HIGHEST: ", highest
