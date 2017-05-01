/* Keisun Wu
 * 20170418
 * 5. Turn a string into an inverted triangle.
 */

var word, newWord : string
put "Enter a word: " ..
get word : *
put skip
for i : 0 .. length (word) div 2
    newWord := word (1 + i .. * - i)
    put repeat (" ", i * 2) ..
    % Iterate each character in shortened word
    for j : 1 .. length (newWord)
	if j = length (newWord) then
	    put newWord (j)
	else
	    put newWord (j), "-" ..
	end if
    end for
end for
