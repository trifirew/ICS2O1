/* Keisun Wu
   20170321
   8. Count the number of names entered by user until user enters capital word "END"
 */

var name : string
var count : int := 0

loop
    put "Enter a name: "
    get name : *
    exit when name = "END"
    count := count + 1
end loop
put "You've entered ", count, " names."
