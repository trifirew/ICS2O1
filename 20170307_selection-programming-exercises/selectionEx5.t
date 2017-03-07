var month : int
get month
if month >= 1 and month <= 3 or month = 12 then
    put "It's winter."
elsif month >= 4 and month <= 5 then
    put "It's spring."
elsif month >= 6 and month <= 8 then
    put "It's summer."
elsif month >= 9 and month <= 11 then
    put "It's autumn."
else
    put "IMPOSSIBLE!"
end if
