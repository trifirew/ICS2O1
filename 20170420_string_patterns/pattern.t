/* Keisun Wu
 * 20170420
 * String Patterns Manipulating Assignment
 *
 * ALL PATTERNS ARE CASE-INSENSITIVE
 *
 * 1. Count Example
 * count ("banana", "a") -> 3
 * count ("keiiisun", "ii") -> 1
 *
 * 2. Eliminate Example
 * eliminate ("banana", "a") -> "bnn"
 * eliminate ("keiiisun", "ii") -> "keisun"
 *
 * 3. Substitute Example
 * substitute ("banana", "a", "f") -> "bfnfnf"
 * substitute ("banana", "an", "DFG") -> "bDFGDFGa"
 */

var choice : string (1)
var word, pattern, replace : string
var menu : array 1 .. 4 of string :=
    init ("1. Count a pattern", "2. Eliminate a pattern",
    "3. Substitute a pattern", "4. Exit")


fcn count (word : string, pattern : string) : int
    % Count the occurence of a pattern (case-insensitive) in a string
    var pattCount : int := 0
    var pattIndex : int
    var i : int := 1
    % for i : 0 .. length (word) - length (pattern)
    %     if word (i + 1 .. i + length (pattern)) = pattern then
    %         patternCount += 1
    %     end if
    % end for
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
    % newWord := ""
    % for i : 1 .. length (word)
    %     if Str.Lower (word (i)) not= Str.Lower (pattern) then
    %         newWord += word (i)
    %     end if
    % end for
    % put newWord
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
	% newWord += word (i .. i + pattIndex - 2) + replace
	% Skip the checked pattern, go after the pattern and loop back
	i += pattIndex + length (pattern) - 1
    end loop
    newWord += word (i .. *)
    result newWord
    % for i : 1 .. length (word)
    %     if Str.Lower (word (i)) not= Str.Lower (pattern) then
    %         newWord += word (i)
    %     else
    %         newWord += replace
    %     end if
    % end for
    % put newWord
end substitute


loop
    cls
    put "String Patterns Manipulating"
    for item : 1 .. 4
	put menu (item)
    end for
    put skip
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
    var ch : char := getchar
end loop
cls
