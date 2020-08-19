# Range

A tool for shell scripts that acts like Python's range.

Print a space-separated list of numbers from A (inclusive)
to B (exclusive) at intervals of C to the standard output.

    range B | A B | A B C | --help | -h

    A     start of range (default = 0)
    B     end of range (default = 1)
    C     increment (default = 1)
   -h     print a help message and exit


## Example

It was created to use in bash for loops.

```sh
for i in $(range 1024 5000 1024); do
    echo $i
done
```

produces

```sh
1024
2048
3072
4096
```

## Build

```sh
mkdir build && cd build
cmake ..
make
```
