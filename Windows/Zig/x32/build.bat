@echo off
zig build-exe bsod.zig -target x86-windows-msvc -O ReleaseSmall
ren bsod.exe bsod_x86.exe

