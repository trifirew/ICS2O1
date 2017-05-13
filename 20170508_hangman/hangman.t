/* Keisun Wu
 * 20170513
 * Hangman Game Assignment
 */

import GUI, Anim in "Anim.tu", G in "G.tu"

% Word variables
var word : string
% var guessed : string
var guessed : flexible array 1 .. 0 of string
var guessMode : string := ""
var guessCount : int
var letterPosition : int
var words : array 0 .. * of string := init (
    "apple",
    "banana",
    "cat",
    "dog",
    "email",
    "frog",
    "golf",
    "home",
    "information",
    "jazz",
    "king",
    "China",
    "Donald Trump",
    "Canada",
    "United States"
    )
% Score counting variables
var countRight, countWrong : int
% Font variables
var fontLetter : int := Font.New ("mono:22:bold")
var fontSans : int := Font.New ("sans serif:16")
% Picture variables
var picHang, picTitle : int
var picMan : array 1 .. 10 of int
% GUI variables
var btnGuessLetter, btnGuessWord, btnNewGame, btnExit : int
var btnLetters : array 0 .. 25 of int

fcn pressedLetter : string
    % Get the clicked letter
    for i : 0 .. 25
	if GUI.GetEventWidgetID = btnLetters (i) then
	    result chr (i + 97)
	end if
    end for
end pressedLetter

fcn correctWord : boolean
    for i : 1 .. length (word)
	if Str.Lower (word (i)) not= Str.Lower (guessed (i)) then
	    result false
	end if
    end for
    result true
end correctWord

fcn correctLetter : boolean
    var correct : boolean := false
    for i : 1 .. length (word)
	if pressedLetter = Str.Lower (word (i)) then
	    % guessed += word (i)
	    correct := true
	    guessed (i) := word (i)
	    Font.Draw (word (i), 22 + i * 25, 300, fontLetter, black)
	end if
    end for
    result correct
end correctLetter

procedure drawMan
    Pic.Draw (picMan (guessCount), 630, 120, picCopy)
end drawMan

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

procedure enableBtnLetters (state : boolean)
    for i : 0 .. 25
	if state then
	    GUI.Enable (btnLetters (i))
	else
	    GUI.Disable (btnLetters (i))
	end if
    end for
end enableBtnLetters

procedure startGuess
    View.Set ("offscreenonly")
    letterPosition := 0
    cls
    for i : 1 .. length (word)
	if word (i) not= " " then
	    drawfillbox (20 + i * 25, 298, 20 + i * 25 + 20, 300, grey)
	    guessed (i) := ""
	else
	    guessed (i) := " "
	end if
    end for
    Pic.Draw (picHang, 450, 60, picMerge)
    if guessCount not= 0 then
	drawMan
    end if
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
    GUI.Refresh
    View.Set ("nooffscreenonly")
end startGuess

procedure genWord
    word := words (Rand.Int (0, upper (words)))
    guessCount := 0
    guessMode := ""
    new guessed, length (word)
    startGuess
end genWord

procedure inputLetter
    % When user clicked a letter
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
	letterPosition += 1
	% Skip space character
	if word (letterPosition) = " " then
	    letterPosition += 1
	end if
	guessed (letterPosition) := pressedLetter
	Font.Draw (pressedLetter, 22 + letterPosition * 25, 300, fontLetter, black)
	if letterPosition = length (word) and (not correctWord) then
	    guessCount += 1
	    startGuess
	end if
    end if
    if correctWord then
	countRight += 1
    elsif guessCount >= 10 then
	countWrong += 1
    else
	return
    end if
    locate (2, 1)
    put "Right: ", countRight, " Wrong: ", countWrong
    visibleBtnLetters (false)
    delay (2000)
    genWord
end inputLetter

procedure initBtnLetters (
	xtl : int, ytl : int,
	width : int, gap : int, column : int
	)
    % Draw a group of 26 buttons of each letter
    % Prevent repetitive GUI.CreateButton codes
    % Parameters:
    % xtl, ytl : coordinates of the top left corner of the group
    % width : width of each button
    % gap : horizontal gap between each button
    % column : number of buttons in a row
    View.Set ("offscreenonly")
    for i : 0 .. 25
	btnLetters (i) := GUI.CreateButton (
	    xtl + i mod column * (width + 10),
	    ytl - i div column * width,
	    width,
	    chr (i + 65),
	    inputLetter
	    )
    end for
    visibleBtnLetters (false)
    View.Set ("nooffscreenonly")
end initBtnLetters

procedure guessLetter
    guessMode := "letter"
    startGuess
    visibleBtnLetters (true)
    enableBtnLetters (true)
end guessLetter

procedure guessTheWord
    guessMode := "word"
    startGuess
    visibleBtnLetters (true)
    enableBtnLetters (true)
end guessTheWord

procedure newGame
    countRight := 0
    countWrong := 0
end newGame

procedure exitGame
    GUI.Quit
end exitGame

procedure openingScreen
    % Initialize pictures
    picHang := Pic.Scale (Pic.FileNew ("hang.gif"), 360, 360)
    for i : 1 .. upper (picMan)
	picMan (i) := Pic.Scale (Pic.FileNew ("man" + intstr (i) + ".gif"), 133, 240)
    end for
    picTitle := Pic.FileNew ("title.gif")
    % Show opening screen
    View.Set ("offscreenonly")
    Pic.Draw (picTitle, 0, 0, picCopy)
    Anim.Slide (Anim.LEFT + Anim.RIGHT, 2, 5)
    loop
	G.textVerticalCentre ("Click anywhere to start", 100, fontSans, black)
	for i : 95 .. 120
	    View.UpdateArea (250, i, 550, i + 1)
	    delay (20)
	end for
	exit when Mouse.ButtonMoved ("down")
	delay (500)
	drawfillbox (250, 90, 550, 120, white)
	for i : 95 .. 120
	    View.UpdateArea (250, i, 550, i + 1)
	    delay (20)
	end for
	exit when Mouse.ButtonMoved ("down")
    end loop
    colorback (darkgrey)
    cls
    Anim.Slide (Anim.LEFT + Anim.RIGHT, 2, 5)
    colorback (white)
    cls
    btnGuessLetter := GUI.CreateButton (0, 0, 200, "Guess a letter", guessLetter)
    btnGuessWord := GUI.CreateButton (200, 0, 200, "Guess a word", guessTheWord)
    btnNewGame := GUI.CreateButton (400, 0, 200, "Give up - New game", newGame)
    btnExit := GUI.CreateButton (600, 0, 200, "Exit game", exitGame)
    delay (300)
    Anim.Slide (Anim.HORI_CENTRE, 2, 5)
    View.Set ("nooffscreenonly")
end openingScreen

View.Set ("graphics:800;480")

% Opening screen
openingScreen


newGame
initBtnLetters (50, 200, 40, 10, 6)

% Generate a word
genWord

loop
    exit when GUI.ProcessEvent
end loop
