/* Keisun Wu
 * 20170513
 * G module
 * Some useful graphics procedures
 */

unit
module G
    export textVerticalCentre, F
    
    proc textVerticalCentre (text : string, y : int, font : int, c : int)
	% Draw text at the vertical centre of the screen
	% text : text to display
	% y : y coordinate in pixel
	% font : font of text
	% c : color of text
	var textWidth : int := Font.Width (text, font) % Get width of text in pixels
	Font.Draw (text, (maxx - textWidth) div 2, y, font, c)
    end textVerticalCentre
    
    fcn F (fontFamily : string, fontSize : int) : int
	result Font.New (fontFamily + ":" + intstr (fontSize))
    end F
end G
