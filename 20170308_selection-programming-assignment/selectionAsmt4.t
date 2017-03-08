% Keisun Wu
% 20170308
% 4) Give a comment depending on the person's choice.

var choice : string
put "Which of these car brands do you like the most?"
put "Please enter one of the cars in the list:"
put "Acura"
put "Audi"
put "Tesla"
put "Toyota"
put "Porsche"

put skip
get choice : *
put skip

case Str.Lower (choice) of
    label "acura" :
	put "It's popular and often affordable!"
    label "audi" :
	put "It's nice but a little bit of expensive!"
    label "tesla" :
	put "You MUST be a geek! But it's so expensive, huh?"
    label "toyota" :
	put "Usually small but affordable!"
    label "porsche" :
	put "Awesome! Work hard, earn lots of money, and then BUY ONE!"
    label :
	put "You are not answering my question properly."
	put "I can't give you any comment."
end case
