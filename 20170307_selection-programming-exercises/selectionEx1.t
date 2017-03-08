var city : string
put "What is the capital of Ontario?"
get city : *
if Str.Lower (city) = "toronto" then
    put "correct"
else
    put "incorrect"
end if
