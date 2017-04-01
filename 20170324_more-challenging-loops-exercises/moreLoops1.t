/* Keisun Wu
 * 20170324
 * 1. Simulate flipping coins
 */

var n : int
var coin : int
var heads, tails : int := 0

put "Enter how many times you want to flip the coin: " ..
get n
assert n > 0
setscreen ("text")
put ""
for i : 1 .. n
    coin := Rand.Int (0, 1)
    if coin = 0 then
	put "heads"
	heads := heads + 1
    else
	put "tails"
	tails := tails + 1
    end if
end for
put ""
put "Heads: ", heads
put "Tails: ", tails
put "Total: ", n
