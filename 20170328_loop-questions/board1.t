/* Keisun Wu
 * 20170328
 * 1. Find all prime numbers before a given number
 */

var num : int
get num
assert num > 0
setscreen ("text")
for i : 2 .. num
    var prime : boolean := true
    for divisor : 2 .. i - 1
	if i mod divisor = 0 then
	    prime := false
	end if
    end for
    if prime then
	put i
    end if
end for
