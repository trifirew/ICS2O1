var word : string
var total : int := 0
for i : 1 .. 10
    put "Enter a word: " ..
    get word : *
    total += length (word)
end for
put "Total: ", total
put "Average: ", total / 10
