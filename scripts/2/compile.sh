#!/bin/bash
cd ./source/13/
for var in *.c
do
        echo gcc -o $var -lm
        gcc -o ${var%.c} $var
done
