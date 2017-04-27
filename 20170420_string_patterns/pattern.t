/* Keisun Wu
 * 20170424
 * String Patterns Manipulating Assignment
 * Ask user for a string and a pattern then count/eliminate/replace the pattern
 * 
 * Patterns are case-insensitive and can be multiple letters
 */

var choice : string (1)
var word, pattern, replace : string
var menu : array 1 .. 4 of string :=
    init ("1. Count a pattern", "2. Eliminate a pattern",
    "3. Substitute a pattern", "4. Exit")


fcn count (word : string, pattern : string) : int
    % Count the occurence of a pattern in a string
    var pattCount : int := 0
    var pattIndex : int
    var i : int := 1
    loop
	% pattIndex : index of the pattern in shortened string
	% word (i .. *) : from current position to the end of string
	pattIndex := index (Str.Lower (word (i .. *)), Str.Lower (pattern))
	exit when pattIndex = 0
	pattCount += 1
	% Skip the checked pattern, go after the pattern and loop back
	i += pattIndex + length (pattern) - 1
    end loop
    result pattCount
end count

fcn eliminate (word : string, pattern : string) : string
    % Eliminate a pattern (case-insensitive) in a string
    var newWord : string := ""
    var pattIndex : int
    var i : int := 1
    loop
	% pattIndex : index of the pattern in shortened string
	% word (i .. *) : from current position to the end of string
	pattIndex := index (Str.Lower (word (i .. *)), Str.Lower (pattern))
	exit when pattIndex = 0
	% Add the part before the pattern of the shortened string into newWord
	newWord += word (i .. *) (1 .. pattIndex - 1)
	% Skip the checked pattern, go after the pattern and loop back
	i += pattIndex + length (pattern) - 1
    end loop
    % Add the part after the last pattern
    newWord += word (i .. *)
    result newWord
end eliminate

fcn substitute (word : string, pattern : string, replace : string) : string
    % Find a pattern (case-insensitive) in a string and replace it
    var newWord := ""
    var pattIndex : int
    var i : int := 1    % Current checking position
    loop
	% pattIndex : index of the pattern in shortened string
	% word (i .. *) : from current position to the end of string
	pattIndex := index (Str.Lower (word (i .. *)), Str.Lower (pattern))
	exit when pattIndex = 0
	% Add the part before the pattern of the shortened string 
	% and the replace string into newWord
	newWord += word (i .. *) (1 .. pattIndex - 1) + replace
	% Skip the checked pattern, go after the pattern and loop back
	i += pattIndex + length (pattern) - 1
    end loop
    newWord += word (i .. *)
    result newWord
end substitute


loop
    cls
    put "String Patterns Manipulating"
    for item : 1 .. 4
	put menu (item)
    end for
    put skip
    % Make sure user press 1 - 4
    loop
	put "Choose one option: " ..
	getch (choice)
	exit when choice >= "1" and choice <= "4"
	put "\nInvalid option. " ..
    end loop
    cls
    exit when choice = "4"
    put menu (strint (choice))
    put "Enter a word or phrase: " ..
    get word : *
    put "Enter a pattern (case-insensitive): " ..
    get pattern : *
    case choice of
	label "1" :
	    put "Count: ", count (word, pattern)
	label "2" :
	    put "New word: ", eliminate (word, pattern)
	label "3" :
	    put "Enter a replacement pattern: " ..
	    get replace : *
	    put "New word: ", substitute (word, pattern, replace)
    end case
    put "\nPress any key to continue... " ..
    % Let user press any key once
    var ch : char := getchar
end loop
cls
