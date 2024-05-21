#!/usr/bin/bash

object_file="tetris.o"
executable_file="tetris"
if [ -e "$object_file" ]; then
    rm "$object_file"
fi
if [ -e "$executable_file" ]; then
    rm "$executable_file"
fi
nasm -f elf64 -o tetris.o tetris.asm
if [ -e "$object_file" ]; then
    ld -o tetris tetris.o
fi