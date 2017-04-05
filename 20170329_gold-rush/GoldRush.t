/* Keisun Wu
 * 20170405
 * Gold Rush Game
 */

setscreen ("graphics:600;600,nobuttonbar")

% Game related
const INTEREST_RATE : real := 0.05
var bank : int
var loanAmount : int
var weeklyRepay : int       % A part of loan player need to repay every week
var weeklyInterest : int    % Interest amount player need to repay every week
var weeklyRepayTotal : int  % Part of loan to repay plus interest every week
var repayWeek : int         % How long will it take the player to repay the loan
var week : int
var life : boolean := true      % Player's life. true: alive, false: lost player's life
var chance : int    % Random integer which determine the result of a site
var loanAmountInput, payInput : int     % Amount entered by player about loan
var site : char     % Choice entered by player, would be '1', '2', '3'
% Font assets
var serif14 : int := Font.New ("serif:14")
var serif12 : int := Font.New ("serif:12")
var serif10 : int := Font.New ("serif:10")
% Image assets
var picGoldrush : int := Pic.FileNew ("goldrush.jpg")
var picMoney : int := Pic.FileNew ("money.jpg")
var picLife : int := Pic.FileNew ("life.jpg")
var picPoor : int := Pic.FileNew ("poor.jpg")
% Color assets
var gold : int := RGB.AddColor (0.773, 0.702, 0.345)
RGB.SetColor (grey, 0.8, 0.8, 0.8)  % Make the grey color brighter

% A procedure to draw text on exactly the vertical centre
proc textVerticalCenter (text : string, y : int, font : int, c : int)
    /**
     * text : text to display
     * y : y coordinate in pixel
     * font : font of text
     * c : color of text
     */
    var textWidth : int := Font.Width (text, font)  % Get width of text in pixels
    Font.Draw (text, (maxx - textWidth) div 2, y, font, c)
end textVerticalCenter

% Update bank amount on the top left corner, with a grey background
proc showBank
    drawfillbox (0, 375, 600, 400, grey)
    Font.Draw ("Week " + intstr (week), 5, 383, serif12, brightblue)
    Font.Draw ("Bank amount: $" + intstr (bank), 205, 383, serif12, black)
    % When player has loan, show loan amount
    if loanAmount not= 0 then
	Font.Draw ("Loan: $" + intstr (loanAmount), 405, 383, serif12, brightred)
    end if
end showBank

% Show the site information player can choose
% c : color of text
proc showSite1 (c : int)
    drawbox (0, 190, 200, 330, black)
    Font.Draw ("Site 1: Lucky Clover", 20, 300, serif14, c)
    Font.Draw ("10% chance at $1000 payload", 30, 270, serif10, c)
    Font.Draw ("30% chance at $500 payload", 30, 250, serif10, c)
    Font.Draw ("60% chance of losing half of", 30, 230, serif10, c)
    Font.Draw ("your money to a thief", 56, 215, serif10, c)
end showSite1
proc showSite2 (c : int)
    drawbox (200, 190, 400, 330, black)
    Font.Draw ("Site 2: Diamond Mine", 220, 300, serif14, c)
    Font.Draw ("20% chance at $800 payload", 230, 270, serif10, c)
    Font.Draw ("40% chance at $400 payload", 230, 250, serif10, c)
    Font.Draw ("40% chance of losing $700", 230, 230, serif10, c)
    Font.Draw ("worth of", 256, 215, serif10, c)
    Font.Draw ("supplies down mine", 256, 200, serif10, c)
end showSite2
proc showSite3 (c : int)
    drawbox (400, 190, 599, 330, black)
    Font.Draw ("Site 3: Hearts are Wild", 420, 300, serif14, c)
    Font.Draw ("10% chance at $8000 payload", 430, 270, serif10, c)
    Font.Draw ("40% chance at $300 payload", 430, 250, serif10, c)
    Font.Draw ("50% chance of losing life", 430, 230, serif10, c)
end showSite3

% Procedure of site 1
proc luckyClover
    % Highlight site 1 on screen
    drawfill (150, 300, brightgreen, black)
    showSite1 (black)
    delay (200)
    locate (3, 1)
    put "You've chosen Site 1: Lucky Clover"
    % Use random integer to determine the result
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
    % Highlight site 2 on screen
    drawfill (350, 300, brightcyan, black)
    showSite2 (black)
    delay (200)
    locate (3, 1)
    put "You've chosen Site 2: Diamond Mine"
    % Use random integer to determine the result
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
    % Highlight site 3 on screen
    drawfill (550, 300, brightred, black)
    showSite3 (black)
    locate (3, 1)
    put "You've chosen Site 3: Hearts are Wild"
    % Use random integer to determine the result
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

% Procedure of loan
proc loan
    loanAmountInput := 0
    payInput := 0
    locate (3, 1)
    % If player doesn't have loan, ask if player want some loan
    if loanAmount = 0 then
	put "Do you need some loan?\n"
	% Make sure player enter a valid input
	loop
	    locate (maxrow - 1, 1)
	    put "Enter a number of loan if you need. Enter 0 if you don't need any: " ..
	    get loanAmountInput
	    exit when loanAmountInput >= 0
	    locate (maxrow - 2, 1)
	    put "Invalid input. Please enter a number equal or greater than 0."
	    locate (maxrow - 1, 1)
	    put ""
	end loop
	% If player enter 0, skip the code below
	if loanAmountInput = 0 then
	    delay (300)
	    return
	end if
	% Make sure player enter a valid input
	loop
	    locate (maxrow - 1, 1)
	    put ""
	    locate (maxrow - 1, 1)
	    put "How many weeks do you want to hold the loan? " ..
	    get repayWeek
	    exit when repayWeek > 0
	    locate (maxrow - 2, 1)
	    put "Invalid input. Please enter a number greater than 0."
	    locate (maxrow - 1, 1)
	    put ""
	end loop
	% Calculate new bank amount, repayment after taking
	loanAmount := loanAmountInput
	bank := bank + loanAmount
	weeklyRepay := round (loanAmount / repayWeek)
	weeklyInterest := round (loanAmount * INTEREST_RATE)
	weeklyRepayTotal := weeklyRepay + weeklyInterest
	% Show information about player's loan
	locate (3, 1)
	put "You've took out a loan of $", loanAmount, "."
	locate (4, 1)
	put "You need to repay $", weeklyRepayTotal, " every week for ", repayWeek, " weeks."
	put "This includes 5% interest. ($", weeklyInterest, ")"
	put "Repayment will be made at the end of week."
    else
	% When player has already took out a loan
	bank := bank - weeklyRepayTotal
	loanAmount := loanAmount - weeklyRepay
	repayWeek := repayWeek - 1
	put "You repay $", weeklyRepayTotal, " this week."
	put "This includes 5% interest. ($", weeklyInterest, ")"
	if repayWeek not= 0 then
	    put "You cannot take another loan until you repay this one."
	    put "You still need to repay your loan for ", repayWeek, " weeks."
	else
	    % When the repay weeks are over, set loan amount to 0
	    % In order to clear the loan amount when it cannot be fully divided by repayWeek
	    loanAmount := 0
	    put "You've repay all your loan!"
	    put "Next week you can take out a new loan if you want to."
	end if
    end if
    showBank
    delay (4000)
end loan

% Show the start screen with a blinking message
loop
    Pic.Draw (picGoldrush, 0, 0, picCopy)
    delay (200)
    locate (maxrow - 5, maxcol div 2 - 12)
    textVerticalCenter ("Press any key to start", 25, serif14, gold)
    delay (500)
    exit when hasch     % Exit loop when any key is pressed
end loop
delay (300)
setscreen ("graphics:600;400")
% Show instruction of the game
textVerticalCenter ("You are now in the era of GOLD RUSH", 290, serif14, black)
textVerticalCenter ("An era of great opportunities", 260, serif14, black)
textVerticalCenter ("You start your adventure with $3000", 230, serif14, black)
textVerticalCenter ("Your supplies will cost you $500 each week", 200, serif14, black)
textVerticalCenter ("Each week you can try on ONE of the sites", 170, serif14, black)
textVerticalCenter ("Both sites have fortune and risk", 140, serif14, black)
textVerticalCenter ("Now, get ready for the challenge of fate", 110, serif14, blue)
locate (maxrow - 1, 1)
Input.Flush
put "Press any key to continue..." ..
var ch : char := getchar

% MAIN BLOCK OF THE GAME ITSELF
loop
    % Each time when the game start/restart, initialize bank, loan, and week
    bank := 3000
    loanAmount := 0
    week := 0
    life := true

    % Loop of each week
    loop
	% Run procedures to show bank amount, and information of each site
	cls
	week := week + 1 % Keep track with week number
	showBank
	showSite1 (green)
	showSite2 (cyan)
	showSite3 (red)
	delay (1000)

	% Deduct $500 from bank as supplies each week
	bank := bank - 500
	locate (3, 1)
	put "Your supplies for this week cost you $500."
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
	showBank % Show bank balance after finishing one of the sites
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

    % Wait 2 seconds for player to see the last messages,
    % then clear the screen and update bank amount on the screen.
    delay (2000)
    cls
    showBank

    % Force repay all loan when player decide to quit
    if loanAmount not= 0 then
	bank := bank - loanAmount
	loanAmount := 0
	textVerticalCenter ("You are now repaying all of your loan.", 10, serif12, black)
	delay (2000)
	cls
	showBank
    end if

    % Handle different outcomes
    if not life then    % When life is false, it means player lost the life
	Pic.Draw (picLife, 150, 100, picCopy)
	textVerticalCenter ("So sad...", 350, serif14, black)
	textVerticalCenter ("You lost your life!", 325, serif14, black)
    elsif bank <= 0 then       % When player is out of money
	Pic.Draw (picPoor, 200, 100, picCopy)
	textVerticalCenter ("You are out of money!", 350, serif14, black)
    elsif bank > 3000 then % Player earn money from the game
	Pic.Draw (picMoney, 200, 100, picCopy)
	textVerticalCenter ("Congratulations! You made a fortune in this game!", 350, serif14, black)
    else                % Player lost some money in the game
	Pic.Draw (picMoney, 200, 100, picCopy)
	textVerticalCenter ("Didn't seem like a gold rush...", 350, serif14, black)
	textVerticalCenter ("At least you still have some money with you!", 325, serif14, black)
    end if
    locate (maxrow - 1, 1)
    put "Press R to restart, press any other key to exit: " ..
    var restart : char := getchar
    exit when restart not= 'R' and restart not= 'r'
end loop
cls
textVerticalCenter ("Thanks for playing!", 200, serif14, black)
delay (2000)
