@echo off
zig build-exe bsod.zig -target x86_64-windows-msvc -O ReleaseSmall
ren bsod.exe bsod_x64.exe

