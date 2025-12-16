#!/bin/bash
nasm -f elf32 panic.asm -o panic.o
ld -m elf_i386 panic.o -o panic_x86

