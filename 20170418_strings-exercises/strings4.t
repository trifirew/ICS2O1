/* Keisun Wu
 * 20170418
 * 4. Get the middle letter of a word.
 */

var word : string
loop
    put "Enter a word: " ..
    get word : *
    if length (word) mod 2 = 0 then
	put "The word has an even number of letters"
    else
	put "The middle letter is ", word (length (word) div 2 + 1)
    end if
end loop
