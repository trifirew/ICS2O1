# Turing Output
20170216

## Changing colors

### To change the color of text

- `color (colorName)` or
- `color (colorNumber)`

Example:

- `color (blue)` -> set color to blue
- `color (1)` -> set color to blue

### To change the background color

#### Change only one line ####

- `colorback (colorName)` or
- `colorback (colorNumber)`

#### Change the whole background ####

```turing
colorback (Color)   % Set background color
cls                 % Clear screen
```

### To create your own color

```turing
RGB.SetColor (colorNumber, r, g, b)
color (colorNumber)
```

| Parameters | Meaning |
| ---------- | ------- |
| `colorNumber` | assign a color number to your own color
| `r` | percentage of red in *decimal (0 to 1)*
| `g` | percentage of green in *decimal (0 to 1)*
| `b` | percentage of blue in *decimal (0 to 1)*

## Locate

`locate (row, column)`

Move your cursor to various locations of screen.

By default:

- row: 1 to 25, integer
- column: 1 to 80, integer

Example:

`locate (5, 20)`: locate to row 5, column 20

### Middle of the screen

`locate (maxrow div 2, maxcol div 2)`

- `maxrow`, `maxcol`: max row and column number
- `div`: always return an *integer*, ignore decimal places

## Miscellaneous

- `cls`: clear screen
- `delay (time)`: pause your program for `time` milliseconds, **1s = 1000ms**
- `repeat (string, int)`: repeat the `string` for `int` times
  - Example: `put repeat ("Hello", 100)` -> put "Hello" for 100 times on the same line
