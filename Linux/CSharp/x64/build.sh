#!/bin/bash
mcs -platform:x64 -out:panic_x64.exe panic.cs
# run with: mono panic_x64.exe
# or with .net core: dotnet build

