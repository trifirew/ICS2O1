/* Keisun Wu
 * 20170406
 * Cash register
 */

const TAX : real := 0.07
var name, response : string
var meal, bill : real

% Ask Y/N questions
proc prompt
    loop
	get response : *
	response := Str.Lower (response)
	exit when response = "y" or response = "n"
	put "" : 8, "Invalid response. Enter again. " ..
    end loop
end prompt

put "Welcome to my awesome restaurant!"
loop
    bill := 0
    put "\nWhat is your name? " ..
    get name : *
    loop
	put "How much did the meal cost? " ..
	loop
	    get meal
	    exit when meal > 0
	    put "" : 8, "Invalid number. Enter again. " ..
	end loop
	bill += meal
	put "Are you paying for any other meals (Y/N)? " ..
	prompt
	exit when response = "n"
    end loop
    if bill > 5 then    % When the bill is over $5, add tax
	bill += bill * TAX
    end if
    put "Your total bill comes to $", bill : 0 : 2, "."
    put "\nAre there any other customers (Y/N)? " ..
    prompt
    exit when response = "n"
end loop
put "\nThank you for eating at my awesome restaurant."
