/*
 * Scanner module - get user input with specified type
 *
 * Keisun Wu
 * 20170406
 */

unit
module Scanner
    export next, nextLine, nextReal, nextInt

    var input : string

    % Get next word (before space)
    fcn next : string
	get input : *
	for i : 1 .. length (input)
	    if input (i) = " " then
		input := input (1 .. i - 1)
		exit
	    end if
	end for
	result input
    end next

    % Get next line
    fcn nextLine : string
	get input : *
	result input
    end nextLine

    % Get next real number
    fcn nextReal : real
	get input : *
	if strrealok (input) then
	    result strreal (input)
	end if
	Error.Halt ("Invalid real input.")
    end nextReal

    % Get next integer
    fcn nextInt : int
	get input : *
	if strintok (input) then
	    result strint (input)
	end if
	Error.Halt ("Invalid integer input.")
    end nextInt

end Scanner
