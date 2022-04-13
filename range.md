% range(1) Version 1.0 | 

# NAME

**range** - print a range of numbers

# DESCRIPTION

Print a space-separated list of numbers from A (inclusive) to B (exclusive)
at intervals of C to the standard output.

range B | A B | A B C | --help | -h

| A     start of range (default = 0)
| B     end of range (default = 1)
| C     increment (default = 1)

# OPTIONS

-h,--help    print a usage message and exit

# EXAMPLES

| **range** --help

| **range** 10
| 0 1 2 3 4 5 6 7 8 9

| **range** 1 11
| 1 2 3 4 5 6 7 8 9 10

| **range** 2 10 2
| 2 4 6 8

# EXIT STATUS

0 Always

# FILES

None

# ENVIRONMENT

None

# BUGS

GitHub Issues:
https://github.com/crithead/range/issues

# AUTHOR

Gene <gene@crithead.com>

# LICENSE

[CC0](https://creativecommons.org/publicdomain/zero/1.0/)
