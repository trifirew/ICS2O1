/* Keisun Wu
 * 20170324
 * 2. Create a wave pattern
 */

var height, waves : int

loop
    put "Height: " ..
    get height
    exit when height >= 1 and height <= 10
    put "Please enter a number between 1 and 10. " ..
end loop
loop
    put "Waves: " ..
    get waves
    exit when waves > 0
    put "Please enter a number greater than 0. " ..
end loop

setscreen ("text")
put skip
for i : 1 .. waves
    for j : 1 .. height
	put repeat ("*", j)
    end for
    for decreasing j : height - 1 .. 1
	put repeat ("*", j)
    end for
end for
