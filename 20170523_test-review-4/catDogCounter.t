/* Keisun Wu
 * 20170523
 * Cat Dog Counter
 * Count how many times the words "cat" and "dog" appear in a phrase
 */

var p, count : int
var word, word1 : string
loop
    put "Enter: " ..
    get word : *
    exit when Str.Lower (word) = "cat dog done"
    count := 0
    word1 := word
    loop
	p := index (Str.Lower (word1 (1 .. *)), "cat")
	exit when p = 0
	count += 1
	word1 := word1 (p + 3 .. *)
    end loop
    word1 := word
    loop
	p := index (Str.Lower (word1 (1 .. *)), "dog")
	exit when p = 0
	count += 1
	word1 := word1 (p + 3 .. *)
    end loop
    put count
end loop
