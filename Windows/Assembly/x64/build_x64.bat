@echo off
ml64 /c bsod_x64.asm
link /subsystem:console bsod_x64.obj kernel32.lib ntdll.lib /entry:main

