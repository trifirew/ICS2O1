/* Keisun Wu
 * 20170418
 * 3. Reverse a word, and determine if it is a palindrome.
 */

var word, reversed : string
loop
    put "Enter a word: " ..
    get word : *
    reversed := ""
    for i : 0 .. length (word) - 1
	reversed += word (* - i)
    end for
    put "The reverse word is ", reversed
    if Str.Lower (reversed) = Str.Lower (word) then
	put "This is a palindrome"
    end if
end loop
