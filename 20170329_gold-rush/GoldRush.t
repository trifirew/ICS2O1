/* Keisun Wu
 * 20170329
 * Gold Rush Game
 */

setscreen ("graphics:600;400,nobuttonbar")

var bank : int := 3000
var debt : int := 0
const INTEREST : real := 0.1
var life : boolean := true
var chance : int
var debtInput, payInput : int
var site : char
var serif14 : int := Font.New ("serif:14")
var serif12 : int := Font.New ("serif:12")
var serif10 : int := Font.New ("serif:10")
var magneto50 : int := Font.New ("Magneto:50")
var magneto20 : int := Font.New ("Magneto:20")
var picMoney : int := Pic.FileNew ("money.jpg")
var picLife : int := Pic.FileNew ("life.jpg")
var picPoor : int := Pic.FileNew ("poor.jpg")
RGB.SetColor (grey, 0.8, 0.8, 0.8)

% A procedure to draw text on exactly the vertical centre
proc textVerticalCenter (text : string, y : int, font : int, c : int)
    /**
     * text : text to display
     * y : y coordinate in pixel
     * font : font of text
     * c : color of text
     */
    var textWidth : int := Font.Width (text, font)
    Font.Draw (text, (maxx - textWidth) div 2, y, font, c)
end textVerticalCenter

% Update bank amount on the top left corner, with a grey background
proc showBank
    drawfillbox (0, 375, 600, 400, grey)
    Font.Draw ("Bank amount: $" + intstr (bank), 5, 383, serif12, black)
    if debt not= 0 then
	Font.Draw ("Loan: $" + intstr (debt), 205, 383, serif12, red)
    end if
end showBank

% Show the sites player can choose
proc showSite1
    drawbox (0, 190, 200, 330, black)
    Font.Draw ("Site 1: Lucky Clover", 20, 300, serif14, black)
    Font.Draw ("10% chance at $1000 payload", 30, 270, serif10, black)
    Font.Draw ("30% chance at $500 payload", 30, 250, serif10, black)
    Font.Draw ("60% chance of losing half of", 30, 230, serif10, black)
    Font.Draw ("your money to a thief", 56, 215, serif10, black)
end showSite1
proc showSite2
    drawbox (200, 190, 400, 330, black)
    Font.Draw ("Site 2: Diamond Mine", 220, 300, serif14, black)
    Font.Draw ("20% chance at $800 payload", 230, 270, serif10, black)
    Font.Draw ("40% chance at $400 payload", 230, 250, serif10, black)
    Font.Draw ("40% chance of losing $700", 230, 230, serif10, black)
    Font.Draw ("worth of", 256, 215, serif10, black)
    Font.Draw ("supplies down mine", 256, 200, serif10, black)
end showSite2
proc showSite3
    drawbox (400, 190, 599, 330, black)
    Font.Draw ("Site 3: Hearts are Wild", 420, 300, serif14, black)
    Font.Draw ("10% chance at $8000 payload", 430, 270, serif10, black)
    Font.Draw ("40% chance at $300 payload", 430, 250, serif10, black)
    Font.Draw ("50% chance of losing life", 430, 230, serif10, black)
end showSite3

% Procedure of site 1
proc luckyClover
    drawfill (150, 300, brightgreen, black)
    showSite1
    delay (200)
    locate (3, 1)
    put "You've chosen Site 1: Lucky Clover"
    chance := Rand.Int (1, 100)
    if chance <= 10 then
	bank := bank + 1000
	put "You won a $1000 payload!"
    elsif chance <= 40 then
	bank := bank + 500
	put "You won a $500 payload!"
    else
	var thief : int := Rand.Int (0, 100)
	var lost : int := round (bank * (thief / 100))
	bank := bank - lost
	put "You lost ", thief, "% of your money ($", lost, ") to a thief."
    end if
end luckyClover

% Procedure of site 2
proc diamondMine
    drawfill (350, 300, brightcyan, black)
    showSite2
    delay (200)
    locate (3, 1)
    put "You've chosen Site 2: Diamond Mine"
    chance := Rand.Int (1, 100)
    if chance <= 20 then
	bank := bank + 800
	put "You won a $800 payload!"
    elsif chance <= 60 then
	bank := bank + 400
	put "You won a $400 payload!"
    else
	bank := bank - 700
	put "You lost $700 worth of your supplies down mine."
    end if
end diamondMine

% Procedure of site 3
proc heartsAreWild
    drawfill (550, 300, brightred, black)
    showSite3
    locate (3, 1)
    put "You've chosen Site 3: Hearts are Wild"
    chance := Rand.Int (1, 100)
    if chance <= 10 then
	bank := bank + 8000
	put "You won a $8000 payload!"
    elsif chance <= 50 then
	bank := bank + 300
	put "You won a $300 payload!"
    else
	life := false
	put "Unfortunately, you lost your life."
    end if
end heartsAreWild

proc loan
    debtInput := 0
    payInput := 0
    locate (3, 1)
    if debt = 0 then
	put "Do you need some loan?\n"
	loop
	    locate (maxrow - 1, 1)
	    put "Enter a number of loan if you need. Enter 0 if you don't need any: " ..
	    get debtInput
	    exit when debtInput >= 0
	    locate (maxrow - 2, 1)
	    put "Invalid input. Please enter a number equal or greater than 0."
	    locate (maxrow - 1, 1)
	    put ""
	end loop
	if debtInput not= 0 then
	    debt := debtInput
	    bank := bank + debt
	    showBank
	    locate (3, 1)
	    put "You've took out a loan of $", debt, "."
	end if
    else
	put "You cannot take another loan until you repay this one."
	put "Do you want to repay some of your loan?"
	loop
	    locate (maxrow - 1, 1)
	    put "Enter a number to repay. Enter 0 if you don't want to repay any: " ..
	    get payInput
	    exit when payInput >= 0 and payInput <= debt
	    locate (maxrow - 2, 1)
	    put "Invalid input. Please enter a number between 0 and your loan amount."
	    locate (maxrow - 1, 1)
	    put ""
	end loop
	if payInput not= 0 then
	    debt := debt - payInput
	    bank := bank - payInput
	    showBank
	    locate (3, 1)
	    put "You current loan amount is $", debt, "."
	end if
    end if
    if debt not= 0 then
	locate (4, 1)
	put "The interest of the loan will be 10% ($", round (debt * 0.1), ") per week."
    end if
    delay (2000)
end loan

% Show the start screen with a blinking message
loop
    cls
    % Font.Draw ("GOLD RUSH", 40, 300, magneto50, brightred)
    textVerticalCenter ("GOLD RUSH", 300, magneto50, brightred)
    textVerticalCenter ("A Game of Chance", 250, magneto20, black)
    delay (200)
    locate (maxrow - 5, maxcol div 2 - 12)
    textVerticalCenter ("Press any key to start", 100, serif14, blue)
    delay (500)
    exit when hasch     % Exit loop when any key is pressed
end loop
cls
delay (500)
% Show instruction of the game
textVerticalCenter ("You are now in the era of GOLD RUSH", 200, serif14, black)
delay (1000)
textVerticalCenter ("An era of great opportunities", 170, serif14, black)
delay (2000)
cls
textVerticalCenter ("You start your adventure with $3000", 200, serif14, black)
delay (1000)
textVerticalCenter ("Your supplies will cost you $500 each week", 170, serif14, black)
delay (1000)
textVerticalCenter ("Each week you can try on ONE of the sites", 140, serif14, black)
delay (1000)
textVerticalCenter ("Both sites have fortune and risk", 110, serif14, black)
delay (2000)
cls
textVerticalCenter ("Now, get ready for the challenge of fate", 200, serif14, blue)

delay (2000)
loop
    % Run procedures to show bank amount, and information of each site
    cls
    showBank
    showSite1
    showSite2
    showSite3
    delay (1000)

    % Deduct $500 from bank as supplies each week
    bank := bank - 500
    locate (3, 1)
    put "Your supplies for this week cost you $500."
    if debt not= 0 then
	bank := bank - (round (debt * 0.1))
	put "Your interest this week is $", round (debt * 0.1), "."
    end if
    showBank
    exit when bank <= 0

    % Ask for choice until a valid choice is pressed
    delay (500)
    loop
	locate (maxrow - 1, 1)
	put "Which site would you like to try? Press 1, 2, or 3: " ..
	Input.Flush
	site := getchar
	exit when site >= '1' and site <= '3'
	locate (maxrow - 2, 1)
	put "Invalid option"
    end loop
    locate (maxrow - 2, 1)
    put ""
    % Based on player's choice, run corresponding procedure of each site
    case site of
	label '1' :
	    luckyClover
	label '2' :
	    diamondMine
	label '3' :
	    heartsAreWild
    end case
    showBank    % Show bank balance after finishing one of the sites

    delay (2000)
    exit when (bank <= 0) or (not life)

    % Ask player if they want to continue playing the game

    locate (maxrow - 1, 1)
    put "Press any key to continue. Press N to quit the game." ..
    var continue : char := getchar
    exit when continue = 'N' or continue = 'n'
    cls
    showBank
    loan
end loop

cls
showBank
if debt not= 0 then
    bank := bank - debt
    debt := 0
    textVerticalCenter ("You are now repaying all of your loan.", 10, serif12, black)
    delay (2000)
    cls
    showBank
end if
if bank <= 0 then
    Pic.Draw (picPoor, 200, 100, picCopy)
    textVerticalCenter ("You are out of money!", 350, serif14, black)
elsif not life then
    Pic.Draw (picLife, 150, 100, picCopy)
    textVerticalCenter ("So sad...", 350, serif14, black)
    textVerticalCenter ("You lost your life!", 325, serif14, black)
elsif bank > 3000 then
    Pic.Draw (picMoney, 200, 100, picCopy)
    textVerticalCenter ("Congratulations! You made a fortune in this game!", 350, serif14, black)
else
    Pic.Draw (picMoney, 200, 100, picCopy)
    textVerticalCenter ("Didn't seem like a gold rush...", 350, serif14, black)
    textVerticalCenter ("At least you still have some money with you!", 325, serif14, black)
end if
textVerticalCenter ("Thanks for playing!", 75, serif14, black)
