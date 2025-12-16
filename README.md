# BSODder

trigger a windows bsod in 24 programming languages for educational purposes

## ⚠️ WARNING

**THIS SOFTWARE WILL IMMEDIATELY CRASH YOUR COMPUTER**

- only run in a virtual machine or test environment
- you will lose all unsaved work
- use at your own risk
- not responsible for any data loss or damage

## what it does

these programs call `RtlAdjustPrivilege` to enable shutdown privileges, then `NtRaiseHardError` with specific flags that force windows to display a blue screen of death. works on windows 7 through windows 11.

## languages

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

## building

each language folder has build.bat or build instructions

### compiled languages

```batch
cd Windows\<Language>\x64
build.bat
```

### interpreted languages

```batch
cd Windows\<Language>
# follow instructions in build.bat
```

### quick examples

**assembly (x64 native tools prompt):**
```batch
cd Windows\Assembly\x64
build_x64.bat
```

**c# (any prompt):**
```batch
cd Windows\CSharp\x64
build.bat
```

**python (no build needed):**
```batch
cd Windows\Python\x64
python bsod.py
```

**powershell (no build needed):**
```batch
cd Windows\PowerShell
powershell -ExecutionPolicy Bypass -File bsod.ps1
```

## running

**seriously, only run this in a vm or test machine**

run as administrator. your system will bsod immediately.

## how it works

1. `RtlAdjustPrivilege(19, TRUE, FALSE, &enabled)` - enables SE_SHUTDOWN_PRIVILEGE
2. `NtRaiseHardError(0xC0000420, 0, 0, NULL, 6, &response)` - triggers bsod with HARDERROR_OVERRIDE_ERRORMODE flag

both functions are undocumented ntdll.dll exports

## project structure

```
Windows/
├── Assembly/       x86/x64 masm
├── C/              x86/x64
├── Cpp/            x86/x64
├── CSharp/         x86/x64
├── FSharp/         x86/x64
├── VBNET/          x86/x64
├── Rust/           x86/x64
├── Go/             x86/x64
├── Nim/            x86/x64
├── Zig/            x86/x64
├── D/              x86/x64
├── V/              x86/x64
├── Delphi/         x86/x64 (free pascal)
├── Kotlin/         x64 only (kotlin native)
├── Crystal/        x64 only
├── Python/         x86/x64 (interpreted)
├── Ruby/           interpreted
├── Perl/           interpreted
├── Lua/            luajit
├── PHP/            php 7.4+ ffi
├── Java/           jvm + jna
├── NodeJS/         node + ffi-napi
├── PowerShell/     script only
└── AutoIt/         x86/x64
```

## license

This is free and unencumbered software released into the public domain. See LICENSE file.
