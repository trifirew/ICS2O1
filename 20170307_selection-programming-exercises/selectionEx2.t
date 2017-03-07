var cost : real
put "How much did your meal cost?"
get cost
if cost > 4 then
    put "You need to pay $", cost * 1.07 : 0 : 2
else
    put "You need to pay $", cost : 0 : 2
end if
