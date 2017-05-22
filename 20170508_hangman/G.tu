/* Keisun Wu
 * 20170519
 * G module
 * Some useful graphics procedures
 */

unit
module G
    export TextVerticalCentre, TextAlignRight

    % Draw text at the vertical centre of the screen
    % text : text to display
    % y : y coordinate in pixel
    % font : font of text
    % c : color of text
    proc TextVerticalCentre (text : string, y : int, font : int, c : int)
	var textWidth : int := Font.Width (text, font) % Get width of text in pixels
	Font.Draw (text, (maxx - textWidth) div 2, y, font, c)
    end TextVerticalCentre

    % Draw text aligned on the right side of the screen
    % text : text to display
    % margin : margin from the right side of the screen
    % y : y coordinate in pixel
    % font : font of text
    % c : color of text
    proc TextAlignRight (text : string, margin : int, y : int, font : int, c : int)
	var textWidth : int := Font.Width (text, font) % Get width of text in pixels
	Font.Draw (text, maxx - textWidth - margin, y, font, c)
    end TextAlignRight
end G
