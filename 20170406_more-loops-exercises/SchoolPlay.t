/* Keisun Wu
 * 20170406
 * School play bill generator
 */

var billAll, billChildren, billStudents, billAdults, billSeniors : real
var age : int
var name, response : string
var countAll, countChildren, countStudents, countAdults, countSeniors : int

proc prompt
    loop
	get response : *
	response := Str.Lower (response)
	exit when response = "y" or response = "n"
	put "" : 8, "Invalid response. Enter again. " ..
    end loop
end prompt

put "Welcome to the school play!"

loop
    put "\nThis is a new group."
    countChildren := 0
    countStudents := 0
    countAdults := 0
    countSeniors := 0
    loop
	put "What is your name? " ..
	get name : *
	put "How old are you? " ..
	loop
	    get age
	    exit when age > 0 and age < 150
	    put "" : 8, "Invalid number. Enter again. " ..
	end loop
	if age < 12 then
	    countChildren += 1
	elsif age < 18 then
	    countStudents += 1
	elsif age <= 65 then
	    countAdults += 1
	else
	    countSeniors += 1
	end if
	put "Do you have others in your group (Y/N)? " ..
	prompt
	exit when response = "n"
    end loop
    billChildren := countChildren * 0.5
    billStudents := countStudents * 2.5
    billAdults := countAdults * 5
    billSeniors := countSeniors * 0.75
    billAll := billChildren + billStudents + billAdults + billSeniors
    put countChildren, " children: $", billChildren : 0 : 2
    put countStudents, " students: $", billStudents : 0 : 2
    put countAdults, " adults: $", billAdults : 0 : 2
    put countSeniors, " seniors: $", billSeniors : 0 : 2
    put "TOTAL: $", billAll : 0 : 2
    put "\nDo you want to start a new group(Y/N)? " ..
    prompt
    exit when response = "n"
end loop
put "\nBye!"
