% Keisun Wu
% 20170308
% 4) Give a comment depending on the person's choice.

var choice : string
var picAcura, picAudi, picPorsche, picTesla, picToyota : int
picAcura := Pic.FileNew ("assets/acura.jpg")
picAudi := Pic.FileNew ("assets/audi.jpg")
picPorsche := Pic.FileNew ("assets/porsche.jpg")
picTesla := Pic.FileNew ("assets/tesla.jpg")
picToyota := Pic.FileNew ("assets/toyota.jpg")

put "Which of these car brands do you like the most?"
put "Please enter one of the cars in the list:"
put "Acura"
put "Audi"
put "Porsche"
put "Tesla"
put "Toyota"

put skip
get choice : *
put skip

case Str.Lower (choice) of
    label "acura" :
	put "It's popular and often affordable!"
	Pic.Draw (picAcura, maxx - 350, 20, picUnderMerge)
    label "audi" :
	put "It's nice but a little bit of expensive!"
	Pic.Draw (picAudi, maxx - 350, 20, picUnderMerge)
    label "porsche" :
	put "Awesome! Work hard, earn lots of money, and then BUY ONE!"
	Pic.Draw (picPorsche, maxx - 350, 20, picUnderMerge)
    label "tesla" :
	put "You MUST be a geek! But it's so expensive, huh?"
	Pic.Draw (picTesla, maxx - 350, 20, picUnderMerge)
    label "toyota" :
	put "Usually small but affordable!"
	Pic.Draw (picToyota, maxx - 350, 20, picUnderMerge)
    label :
	put "You are not answering my question properly."
	put "I can't give you any comment."
end case
