/* Keisun Wu
 * 20170324
 * 3. Simulate stopwatch
 */

var tenthSecond, minute : int := 0
loop
    cls
    put minute, ":", tenthSecond / 10 : 0 : 1
    delay (100)
    tenthSecond := tenthSecond + 1
    if tenthSecond = 600 then
	minute := minute + 1
	tenthSecond := 0
    end if
end loop
