# Screen
20170222

## *setscreen* statement

`setscreen ("text")`

`setscreen ("graphics")` - default screen mode

`setscreen ("text:50,50")` - text mode, 50 rows by 50 columns

`setscreen ("graphics:50,50")` - graphics mode, 50 pixels(x) by 50 pixels(y)

### Two modes of screen ###

| Text | Graphics |
| ---- | -------- |
| No colours | / |
| No `locate` statement | / |
| No drawing | / |
| *Advantage:* If text runs out of screen, you can scroll up and down. | *Disadvantage:* If text runs out of screen, no scrolling is available. |

## Default screen size

In rows & column:
- Rows: `maxrow`
- Columns: `maxcol`

In pixels:
- x-axis: `maxx`
- y-axis: `maxy`

## *locate* & *locatexy* statement

`locate (row, column)`

`locatexy (x, y)`

Example:
- `locate (5, 20)` - 5th *row*, 20th *column* **(from top left corner)**
- `locatexy (500, 200)` - 500th pixel in *x-axis*, 200th pixel in *y-axis* **(from bottom left corner)**

| Code | Location |
| ---- | -------- |
| `locatexy (0, 0)` | bottom left |
| `locatexy (maxx, maxy)` | top right |
| `locatexy (maxx div 2, 0)` | bottom middle |
