@echo off
ml /c /coff bsod_x86.asm
link /subsystem:console bsod_x86.obj kernel32.lib ntdll.lib

