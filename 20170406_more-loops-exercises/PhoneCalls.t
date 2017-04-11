/* Keisun Wu
 * 20170411
 * Phone callsC billC generator
 */

setscreen ("text")

var billC, billA : real
var minutes, totalMinC, totalMinA, callsC, callsA : int
var avgMinC, avgMinA : real
var name, response : string
% billC : bill for one customer
% billA : bill for all customers
% totalMinC : minutes count for one customer
% totalMinA : minutes count for all customers
% callsC : call count for one customer
% callsA : call count for all customers
% avgMinC : average call minutes for one customer
% avgMinA : average call minutes for all customers


% Ask Y/N questions
proc prompt
    loop
	get response : *
	response := Str.Lower (response)
	exit when response = "y" or response = "n"
	put "" : 8, "Invalid response. Enter again. " ..
    end loop
end prompt

put "Phone calls bill generator"
billA := 0
totalMinA := 0
callsA := 0

loop
    put "\nThis is a new bill."
    put "Enter phone owner's name: " ..
    get name : *
    billC := 0
    totalMinC := 0
    callsC := 0
    loop
	put "Enter your call length in minutes: " ..
	loop
	    get minutes
	    exit when minutes > 0
	    put "" : 8, "Invalid number. Enter again. " ..
	end loop
	totalMinC += minutes
	callsC += 1
	if minutes <= 3 then
	    billC += 1.24
	else
	    billC += 1.24 + 0.76 * (minutes - 3)
	end if
	put "Do you have other calls (Y/N)? " ..
	prompt
	exit when response = "n"
    end loop
    avgMinC := totalMinC / callsC
    put "Total cost for ", name, " is $", billC : 0 : 2, "."
    put "You've made ", callsC, " calls in total."
    put "Average minutes per call is ", avgMinC : 0 : 1, " minutes."
    billA += billC
    totalMinA += totalMinC
    callsA += callsC
    
    put "\nDo you want to start a new customer (Y/N)? " ..
    prompt
    exit when response = "n"
end loop

avgMinA := totalMinA / callsA
put "\nTotal cost for all customers is $", billA : 0 : 2, "."
put "All customers have made ", callsA, " calls in total."
put "Average minutes per call for all customers is ", avgMinA : 0 : 1, " minutes."
put "\nBye!"
