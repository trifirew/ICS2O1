/* Keisun Wu
 * 20170328
 * 2. Draw stars of random sizes
 */

import GUI

var size, x, y, c : int
var btnStart, btnStop : int
var started : boolean := false

proc star
    size := Rand.Int (10, 100)
    x := Rand.Int (0, maxx - 100)
    y := Rand.Int (50, maxy - 100)
    c := Rand.Int (0, maxcolor)
    drawfillstar (x, y, x + size, y + size, c)
    delay (500)
end star

proc start
    started := true
end start

proc stop
    started := false
end stop

btnStart := GUI.CreateButton (50, 10, 0, "START", start)
btnStop := GUI.CreateButton (200, 10, 0, "STOP", stop)

loop
    exit when GUI.ProcessEvent
    if started then
	star
    end if
end loop
