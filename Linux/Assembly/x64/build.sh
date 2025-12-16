#!/bin/bash
nasm -f elf64 panic.asm -o panic.o
ld panic.o -o panic_x64

