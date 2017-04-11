/* Keisun Wu
 * 20170411
 * School play bill generator
 */

setscreen ("text") 

var billAll, billChildren, billStudents, billAdults, billSeniors : real
var age : int
var name, response : string
var countAll, countChildren, countStudents, countAdults, countSeniors : int
var revenue : real
var attend : int

% Ask Y/N questions
proc prompt
    loop
	get response : *
	response := Str.Lower (response)
	exit when response = "y" or response = "n"
	put "" : 8, "Invalid response. Enter again. " ..
    end loop
end prompt

put "Welcome to the school play!"
revenue := 0
attend := 0

loop
    put "\nThis is a new group."
    put "Enter group leader's name: " ..
    get name : *
    countChildren := 0
    countStudents := 0
    countAdults := 0
    countSeniors := 0
    loop
	put "Enter your age: " ..
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
    countAll := countChildren + countStudents + countAdults + countSeniors
    put countChildren, " children: $", billChildren : 0 : 2
    put countStudents, " students: $", billStudents : 0 : 2
    put countAdults, " adults: $", billAdults : 0 : 2
    put countSeniors, " seniors: $", billSeniors : 0 : 2
    put "TOTAL: ", countAll, " people, $", billAll : 0 : 2
    revenue += billAll
    attend += countAll
    put "\nDo you want to start a new group(Y/N)? " ..
    prompt
    exit when response = "n"
end loop

put "\nTOTAL ATTEND PEOPLE COUNT: ", attend
put "TOTAL REVENUE: ", revenue
put "\nBye!"
