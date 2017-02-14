# Turing Basics
20170214

## Fieldwidths

- Numbers are **right-justified**
- Strings are **left-justified**

Examples:

  - `put "234" : 5` outputs `234··`
  - `put 234 : 5` outputs `··234`

## Round

Examples

  - `put 234.237 : 0 : 2` outputs `234.24`

## Operations

**BEDMAS Rule**

Types:

  - `+`
  - `-`
  - `*`
  - `/`
  - `mod` (modulus)
  - `()`

*Default: 6 decimal places*

## Continuous outputs

- Every `put` statement adds an `ENTER` at the end.
- Add `..` to the end to stay at the same line.

To skip a line:

  - `put ""` or
  - `put skip`

Comma (`,`) : Join any type of data
