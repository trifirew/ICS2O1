/* Keisun Wu
 * 20170519
 * Hangman Game Assignment
 * Both keyboard and mouse control are allowed
 * Bonus: Highest score
 *        Animation for win/lose
 *        Display word category
 *        More Animation
 */

import GUI, Anim in "Anim.tu", G in "G.tu", WordBank in "WordBank.tu"
% Anim: Animation module
% G: Graphics module
% WordBank: All words

% Word variables
var word : string   % Random word generated to be guessed by player
var hint : string   % Hint(Category) of the word
var guessed : flexible array 1 .. 0 of string   % Player's guess
var guessMode : string := ""    % Either "letter" or "word"
var guessCount : int    % Counter of player's attempts, associate with the drawing of man
var letterPosition : int    % Used in "guess the word" mode, the index of word the player is entering
var words := WordBank.words
% Score counting variables
var countRight, countWrong : int
% Player variables
type Player :
    record
	name : string
	right : int
	wrong : int
    end record
var player : Player := init ("Anonymous", 0, 0) % Current player
var highestPlayer : Player := init ("Anonymous", 0, 0)
% Font variables
var fontLetter : int := Font.New ("mono:22:bold")
var fontMono28 : int := Font.New ("mono:28")
var fontSans40 : int := Font.New ("sans serif:40")
var fontSans36 : int := Font.New ("sans serif:36")
var fontSans24 : int := Font.New ("sans serif:24")
var fontSans16 : int := Font.New ("sans serif:16")
var fontSans12 : int := Font.New ("sans serif:12")
% Picture variables
var picHang, picTitle : int
var picMan : array 1 .. 10 of int
% GUI variables
var btnGuessLetter, btnGuessWord, btnNewGame, btnExit : int
var btnLetters : array 0 .. 25 of int   % 26 buttons for the letters

% Get the clicked letter
fcn pressedLetter : string
    for i : 0 .. 25
	if GUI.GetEventWidgetID = btnLetters (i) then
	    result chr (i + 97)
	end if
    end for
end pressedLetter

% Check if the whole word is correct
fcn correctWord : boolean
    for i : 1 .. length (word)
	if Str.Lower (word (i)) not= Str.Lower (guessed (i)) then
	    result false
	end if
    end for
    result true
end correctWord

% Check if the letter exist in the word
fcn correctLetter : boolean
    var correct : boolean := false
    for i : 1 .. length (word)
	if pressedLetter = Str.Lower (word (i)) then
	    correct := true
	    guessed (i) := word (i)
	    Font.Draw (word (i), 22 + i * 25, 300, fontLetter, black)
	end if
    end for
    result correct
end correctLetter

% Draw the picture of the hangman
procedure drawMan
    Pic.Draw (picMan (guessCount), 639, 150, picCopy)
end drawMan

% Set letter buttons visibility
procedure visibleBtnLetters (state : boolean)
    View.Set ("offscreenonly")
    for i : 0 .. 25
	GUI.SetColor (btnLetters (i), grey)
	if state then
	    GUI.Show (btnLetters (i))
	else
	    GUI.Hide (btnLetters (i))
	end if
    end for
    View.Set ("nooffscreenonly")
end visibleBtnLetters

% Set letter buttons enable or not
procedure enableBtnLetters (state : boolean)
    for i : 0 .. 25
	if state then
	    GUI.Enable (btnLetters (i))
	else
	    GUI.Disable (btnLetters (i))
	end if
    end for
end enableBtnLetters

% Show player's score at the top of the screen
procedure showScore
    drawfillbox (0, 440, maxx, 480, grey)
    Font.Draw (player.name, 20, 454, fontSans12, black)
    G.TextVerticalCentre ("Right: " + intstr (player.right), 464, fontSans12, green)
    G.TextVerticalCentre ("Wrong: " + intstr (player.wrong), 444, fontSans12, red)
    G.TextAlignRight ("Score: " + intstr (player.right - player.wrong), 20, 454, fontSans12, black)
end showScore

% Start a new guess
% Draw related components
procedure startGuess
    View.Set ("offscreenonly")
    letterPosition := 0
    cls
    % Draw segments of line according to the length of the word
    for i : 1 .. length (word)
	% Skip space character
	if word (i) not= " " then
	    drawfillbox (20 + i * 25, 298, 20 + i * 25 + 20, 300, grey)
	    guessed (i) := ""
	else
	    guessed (i) := " "
	end if
    end for
    Font.Draw ("Category: " + hint, 45, 350, fontSans16, black)
    Pic.Draw (picHang, 450, 60, picMerge)
    % If player switch mode during guessing, redraw the image of hangman
    if guessCount not= 0 then
	drawMan
    end if
    % Change color of corresponding buttons
    if guessMode = "letter" then
	GUI.SetColor (btnGuessLetter, white)
	GUI.SetColor (btnGuessWord, grey)
	GUI.Disable (btnGuessLetter)
    elsif guessMode = "word" then
	GUI.SetColor (btnGuessLetter, grey)
	GUI.SetColor (btnGuessWord, white)
	GUI.Enable (btnGuessLetter)
    else
	GUI.SetColor (btnGuessLetter, grey)
	GUI.SetColor (btnGuessWord, grey)
	GUI.Enable (btnGuessLetter)
    end if
    showScore
    enableBtnLetters (true)
    Input.Flush
    GUI.Refresh
    View.Set ("nooffscreenonly")
end startGuess

% Generate a new word
procedure genWord
    var wordIndex : int := Rand.Int (0, upper (words))
    word := words (wordIndex).word
    hint := words (wordIndex).hint
    guessCount := 0
    guessMode := ""
    new guessed, length (word)
    startGuess
end genWord

% After player win/lose, show the word and score
procedure outputResult
    delay (1000)
    View.Set ("offscreenonly")
    if correctWord then
	player.right += 1
	drawfillbox (0, 0, maxx, maxy, green)
	G.TextVerticalCentre ("You got it right!", 280, fontSans24, yellow)
    elsif guessCount >= 10 then
	player.wrong += 1
	drawfillbox (0, 0, maxx, maxy, red)
	G.TextVerticalCentre ("You got it wrong...", 280, fontSans24, yellow)
    end if
    G.TextVerticalCentre (word, 222, fontSans36, white)
    G.TextVerticalCentre ("Score: " + intstr (player.right - player.wrong), 150, fontSans24, yellow)
    G.TextVerticalCentre ("Right: " + intstr (player.right), 110, fontSans16, grey)
    G.TextVerticalCentre ("Wrong: " + intstr (player.wrong), 80, fontSans16, grey)
    Anim.Uncover (Anim.TOP, 2, 5)
    delay (1000)
    Anim.Cover (white, Anim.TOP, 2, 5)
    showScore
    visibleBtnLetters (false)
    genWord
    View.Set ("nooffscreenonly")
end outputResult

% Called hen user clicked a letter
% Input the letter
procedure inputLetter
    if guessMode = "letter" then
	GUI.Disable (GUI.GetEventWidgetID)
	GUI.SetColor (GUI.GetEventWidgetID, white)
	% Check if the letter is in the word
	if not correctLetter then
	    guessCount += 1
	    drawMan
	end if
	GUI.Refresh
    elsif guessMode = "word" and letterPosition < length (word) then
	% Input the letter on the lines
	letterPosition += 1
	% Skip space character
	if word (letterPosition) = " " then
	    letterPosition += 1
	end if
	guessed (letterPosition) := pressedLetter
	Font.Draw (pressedLetter, 22 + letterPosition * 25, 300, fontLetter, black)
	% When player fill the line, and the word is wrong
	if letterPosition = length (word) and (not correctWord) then
	    enableBtnLetters (false)
	    delay (1500)
	    guessCount += 1
	    startGuess
	end if
    end if
    if correctWord or guessCount >= 10 then
	outputResult
    end if
end inputLetter

% Draw a group of 26 buttons of each letter
% Prevent repetitive GUI.CreateButton codes
% Parameters:
% xtl, ytl : coordinates of the top left corner of the group
% width : width of each button
% gap : horizontal gap between each button
% column : number of buttons in a row
procedure initBtnLetters (
	xtl : int, ytl : int,
	width : int, gap : int, column : int
	)
    for i : 0 .. 25
	btnLetters (i) := GUI.CreateButtonFull (
	    xtl + i mod column * (width + 10),
	    ytl - i div column * width,
	    width,
	    chr (i + 65),
	    inputLetter,
	    0,
	    chr (i + 97),
	    false
	    )
    end for
    visibleBtnLetters (false)
end initBtnLetters

% Called when "Guess a letter" button is clicked
% Set guess mode to single letter
procedure guessLetter
    guessMode := "letter"
    startGuess
    visibleBtnLetters (true)
end guessLetter

% Called when "Guess the word" button is clicked
% Set guess mode to the whole word
procedure guessTheWord
    guessMode := "word"
    startGuess
    visibleBtnLetters (true)
end guessTheWord

% Called when "Give up - New game" button is clicked
% Start a new game(player)
procedure newGame
    var inputChar : char
    View.Set ("offscreenonly,nocursor")
    % Record highest score
    if player.right - player.wrong > highestPlayer.right - highestPlayer.wrong then
	highestPlayer := player
    end if
    % Simulate a curtain closing
    Anim.Cover (cyan, Anim.LEFT + Anim.RIGHT, 5, 15)
    delay (100)
    % Get player name
    G.TextVerticalCentre ("Enter your name", 300, fontSans24, white)
    G.TextVerticalCentre ("Once you are done, hit ENTER", 270, fontSans16, grey)
    G.TextVerticalCentre ("Make sure your CapsLock is off during the game", 20, fontSans12, yellow)
    drawfillbox (220, 210, 580, 212, grey)
    View.Update
    player.name := ""
    % Simulate a "get", with input always at the vertical centre
    loop
	locate (1, 1)
	Input.Flush
	inputChar := getchar
	if inputChar = KEY_BACKSPACE and length (player.name) > 0 then
	    player.name := player.name (1 .. * -1)
	    drawfillbox (0, 0, maxx, 209, cyan)
	elsif inputChar not= KEY_BACKSPACE and inputChar not= KEY_ENTER and length (player.name) < 16 then
	    player.name += inputChar
	    drawfillbox (0, 0, maxx, 209, cyan)
	elsif inputChar = KEY_ENTER and length (player.name) > 0 and player.name (1) not= " " and player.name (*) not= " " then
	    exit
	else
	    drawfillbox (220, 210, 580, 212, yellow)
	    View.Update
	    delay (200)
	    drawfillbox (220, 210, 580, 212, grey)
	    drawfillbox (0, 0, maxx, 209, cyan)
	    G.TextVerticalCentre ("You should not start or end your name with a space.", 160, fontSans12, yellow)
	    G.TextVerticalCentre ("Your name should be 1 - 16 characters.", 180, fontSans12, yellow)
	end if
	drawfillbox (0, 213, maxx, 260, cyan)
	G.TextVerticalCentre (player.name, 220, fontMono28, white)
	View.Update
    end loop
    player.right := 0
    player.wrong := 0
    % Simulate a curtain opening
    delay (500)
    colorback (white)
    cls
    GUI.Show (btnGuessLetter)
    GUI.Show (btnGuessWord)
    GUI.Show (btnNewGame)
    GUI.Show (btnExit)
    showScore
    Anim.Uncover (Anim.HORI_CENTRE, 5, 15)
    View.Set ("nooffscreenonly")
    % Generate a word
    genWord
end newGame

% Called when "Exit game" button is clicked
% Graphics when the player exit the game
procedure exitGame
    % Record highest score
    if player.right - player.wrong > highestPlayer.right - highestPlayer.wrong then
	highestPlayer := player
    end if
    View.Set ("offscreenonly")
    drawfillbox (0, 0, maxx, maxy, darkgrey)
    G.TextVerticalCentre ("Thanks for playing!", 260, fontSans40, white)
    % Show the highest score and player name
    G.TextVerticalCentre ("Highest score", 180, fontSans16, white)
    G.TextVerticalCentre (highestPlayer.name, 140, fontSans24, yellow)
    G.TextVerticalCentre ("Right: " + intstr (highestPlayer.right), 80, fontSans12, white)
    G.TextVerticalCentre ("Wrong: " + intstr (highestPlayer.wrong), 60, fontSans12, white)
    G.TextVerticalCentre ("Score: " + intstr (highestPlayer.right - highestPlayer.wrong), 110, fontSans16, yellow)
    Anim.Uncover (Anim.LEFT + Anim.RIGHT, 5, 15)
    GUI.Quit
end exitGame

% Show the graphical opening screen
procedure openingScreen
    View.Set ("offscreenonly")
    Pic.Draw (picTitle, 0, 0, picCopy)
    Anim.Uncover (Anim.LEFT + Anim.RIGHT, 2, 5)
    % Blinking start hint
    loop
	G.TextVerticalCentre ("Click anywhere to start", 100, fontSans16, black)
	Anim.UncoverArea (250, 95, 550, 120, Anim.BOTTOM, 1, 20)
	exit when Mouse.ButtonMoved ("down")
	delay (500)
	drawfillbox (250, 90, 550, 120, white)
	Anim.UncoverArea (250, 95, 550, 120, Anim.BOTTOM, 1, 20)
	exit when Mouse.ButtonMoved ("down")
    end loop
end openingScreen

View.Set ("graphics:800;480,offscreenonly")


% Initialize graphics
picHang := Pic.Scale (Pic.FileNew ("hang.gif"), 360, 360)
for i : 1 .. upper (picMan)
    picMan (i) := Pic.Scale (Pic.FileNew ("man" + intstr (i) + ".gif"), 116, 210)
end for
picTitle := Pic.FileNew ("title.gif")
initBtnLetters (50, 200, 40, 10, 6)
btnGuessLetter := GUI.CreateButton (0, 0, 200, "Guess a letter", guessLetter)
btnGuessWord := GUI.CreateButton (200, 0, 200, "Guess the word", guessTheWord)
btnNewGame := GUI.CreateButton (400, 0, 200, "Give up - New game", newGame)
btnExit := GUI.CreateButton (600, 0, 200, "Exit game", exitGame)
GUI.Hide (btnGuessLetter)
GUI.Hide (btnGuessWord)
GUI.Hide (btnNewGame)
GUI.Hide (btnExit)

% Show opening screen
openingScreen
% Start a new game
newGame

loop
    exit when GUI.ProcessEvent
end loop
