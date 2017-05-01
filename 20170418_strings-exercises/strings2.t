/* Keisun Wu
 * 20170418
 * 2. Get the first and the last letter of a word.
 */

var word : string
put "Enter a series of words. (End with the word 'wow')"
loop
    put "Enter word: " ..
    get word : *
    exit when Str.Lower (word) = "wow"
    if length (word) = 1 then
	put "Word has only 1 character."
    else
	put word (1), word (*)
    end if
end loop
