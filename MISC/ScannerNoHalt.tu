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
	get input
	result input
    end next
    
    % Get next line
    fcn nextLine : string
	get input : *
	result input
    end nextLine

    % Get next real number
    fcn nextReal : real
	loop
	    get input : *
	    exit when strrealok (input)
	end loop
	result strreal (input)
    end nextReal

    % Get next integer
    fcn nextInt : int
	loop
	    get input : *
	    exit when strintok (input)
	end loop
	result strint (input)
    end nextInt
    
end Scanner
