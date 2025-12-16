# BSODder

trigger a windows bsod or linux kernel panic in 24+ programming languages for educational purposes

## ⚠️ WARNING

**THIS SOFTWARE WILL IMMEDIATELY CRASH YOUR COMPUTER**

- only run in a virtual machine or test environment
- you will lose all unsaved work
- use at your own risk
- not responsible for any data loss or damage

## what it does

### windows
calls `RtlAdjustPrivilege` to enable shutdown privileges, then `NtRaiseHardError` with specific flags that force windows to display a blue screen of death.

### linux
writes 'c' to `/proc/sysrq-trigger` which triggers an immediate kernel panic.

## languages

### windows (24 languages)

| language | x32 | x64 | compiler/runtime needed |
|----------|-----|-----|------------------------|
| Assembly | ✓ | ✓ | MASM (ml/ml64) |
| C | ✓ | ✓ | MSVC (cl) |
| C++ | ✓ | ✓ | MSVC (cl) |
| C# | ✓ | ✓ | .NET SDK (csc) |
| F# | ✓ | ✓ | .NET SDK (fsc) |
| VB.NET | ✓ | ✓ | .NET SDK (vbc) |
| Rust | ✓ | ✓ | Rust + MSVC target |
| Go | ✓ | ✓ | Go compiler |
| Nim | ✓ | ✓ | Nim compiler |
| Zig | ✓ | ✓ | Zig compiler |
| D | ✓ | ✓ | DMD compiler |
| V | ✓ | ✓ | V compiler |
| Delphi/Pascal | ✓ | ✓ | Free Pascal (fpc) |
| Kotlin | - | ✓ | Kotlin Native |
| Crystal | - | ✓ | Crystal compiler |
| Python | ✓ | ✓ | Python (ctypes) |
| Ruby | ✓ | ✓ | Ruby (fiddle) |
| Perl | ✓ | ✓ | Perl + Win32::API |
| Lua | ✓ | ✓ | LuaJIT (ffi) |
| PHP | ✓ | ✓ | PHP 7.4+ (ffi) |
| Java | ✓ | ✓ | Java + JNA |
| Node.js | ✓ | ✓ | Node + ffi-napi |
| PowerShell | ✓ | ✓ | PowerShell (built-in) |
| AutoIt | ✓ | ✓ | AutoIt3 + Aut2exe |

### linux (23 languages)

| language | x32 | x64 | compiler/runtime needed |
|----------|-----|-----|------------------------|
| Assembly | ✓ | ✓ | NASM + ld |
| C | ✓ | ✓ | GCC |
| C++ | ✓ | ✓ | G++ |
| C# | ✓ | ✓ | Mono (mcs) |
| F# | ✓ | ✓ | Mono (fsharpc) |
| VB.NET | ✓ | ✓ | Mono (vbnc) |
| Rust | ✓ | ✓ | Rust |
| Go | ✓ | ✓ | Go compiler |
| Nim | ✓ | ✓ | Nim compiler |
| Zig | ✓ | ✓ | Zig compiler |
| D | ✓ | ✓ | DMD compiler |
| V | ✓ | ✓ | V compiler |
| Delphi/Pascal | ✓ | ✓ | Free Pascal (fpc) |
| Kotlin | - | ✓ | Kotlin Native |
| Crystal | - | ✓ | Crystal compiler |
| Python | ✓ | ✓ | Python |
| Ruby | ✓ | ✓ | Ruby |
| Perl | ✓ | ✓ | Perl |
| Lua | ✓ | ✓ | Lua / LuaJIT |
| PHP | ✓ | ✓ | PHP |
| Java | ✓ | ✓ | Java |
| Node.js | ✓ | ✓ | Node.js |
| PowerShell | ✓ | ✓ | PowerShell Core (pwsh) |
| Bash | ✓ | ✓ | Bash (built-in) |

## building

### windows
```batch
cd Windows\<Language>\x64
build.bat
```

### linux
```bash
cd Linux/<Language>/x64
chmod +x build.sh
./build.sh
```

## running

### windows
run as administrator:
```batch
bsod_x64.exe
```

### linux
run as root:
```bash
sudo ./panic_x64
# or for interpreted:
sudo python3 panic.py
```

## how it works

### windows
1. `RtlAdjustPrivilege(19, TRUE, FALSE, &enabled)` - enables SE_SHUTDOWN_PRIVILEGE
2. `NtRaiseHardError(0xC0000420, 0, 0, NULL, 6, &response)` - triggers bsod

both are undocumented ntdll.dll exports

### linux
```bash
echo c > /proc/sysrq-trigger
```
the kernel's magic sysrq key - 'c' triggers a crash dump / kernel panic

## project structure

```
Windows/
├── Assembly/       masm x86/x64
├── C/              msvc
├── Cpp/            msvc
├── CSharp/         .net
├── FSharp/         .net
├── VBNET/          .net
├── Rust/           rustc
├── Go/             go
├── Nim/            nim
├── Zig/            zig
├── D/              dmd
├── V/              v
├── Delphi/         fpc
├── Kotlin/         kotlin native
├── Crystal/        crystal
├── Python/         ctypes
├── Ruby/           fiddle
├── Perl/           Win32::API
├── Lua/            luajit ffi
├── PHP/            ffi
├── Java/           jna
├── NodeJS/         ffi-napi
├── PowerShell/     built-in
└── AutoIt/         dllcall

Linux/
├── Assembly/       nasm x86/x64
├── C/              gcc
├── Cpp/            g++
├── CSharp/         mono
├── FSharp/         mono
├── VBNET/          mono
├── Rust/           rustc
├── Go/             go
├── Nim/            nim
├── Zig/            zig
├── D/              dmd
├── V/              v
├── Delphi/         fpc
├── Kotlin/         kotlin native
├── Crystal/        crystal
├── Python/         built-in
├── Ruby/           built-in
├── Perl/           built-in
├── Lua/            lua/luajit
├── PHP/            built-in
├── Java/           jdk
├── NodeJS/         node
├── PowerShell/     pwsh
└── Bash/           built-in
```

## license

This is free and unencumbered software released into the public domain. See LICENSE file.
