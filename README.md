# BSODder

trigger a windows bsod in multiple programming languages for educational purposes

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
| C# | ✓ | ✓ | .NET SDK or csc |
| Nim | ✓ | ✓ | Nim compiler |
| Delphi/Pascal | ✓ | ✓ | Free Pascal (fpc) |
| AutoIt | ✓ | ✓ | AutoIt3 + Aut2exe |
| Python | ✓ | ✓ | Python (or PyInstaller) |
| Rust | ✓ | ✓ | Rust + MSVC target |
| Go | ✓ | ✓ | Go compiler |

## building

each language folder has x32 and x64 subfolders with a build.bat

### assembly
```batch
# x86 Native Tools Command Prompt
cd Windows\Assembly\x32
build_x86.bat

# x64 Native Tools Command Prompt  
cd Windows\Assembly\x64
build_x64.bat
```

### c
```batch
# x86 Native Tools Command Prompt
cd Windows\C\x32
build.bat

# x64 Native Tools Command Prompt
cd Windows\C\x64
build.bat
```

### c#
```batch
cd Windows\CSharp\x32
build.bat

cd Windows\CSharp\x64
build.bat
```

### nim
```batch
cd Windows\Nim\x32
build.bat

cd Windows\Nim\x64
build.bat
```

### delphi/pascal (free pascal)
```batch
cd Windows\Delphi\x32
build.bat

cd Windows\Delphi\x64
build.bat
```

### autoit
```batch
# use autoit compiler gui or command line
cd Windows\AutoIt\x32
Aut2exe /in bsod.au3 /out bsod_x86.exe /x86

cd Windows\AutoIt\x64
Aut2exe /in bsod.au3 /out bsod_x64.exe /x64
```

### python
```batch
# run directly (use 32 or 64 bit python)
python bsod.py

# or compile with pyinstaller
cd Windows\Python\x64
pyinstaller --onefile bsod.py
```

### rust
```batch
cd Windows\Rust\x32
build.bat

cd Windows\Rust\x64
build.bat
```

### go
```batch
cd Windows\Go\x32
build.bat

cd Windows\Go\x64
build.bat
```

## running

**seriously, only run this in a vm or test machine**

run as administrator. your system will bsod immediately.

## how it works

1. `RtlAdjustPrivilege(19, TRUE, FALSE, &enabled)` - enables SE_SHUTDOWN_PRIVILEGE
2. `NtRaiseHardError(0xC0000420, 0, 0, NULL, 6, &response)` - triggers bsod with HARDERROR_OVERRIDE_ERRORMODE flag

both functions are undocumented ntdll.dll exports

## license

educational purposes only. use responsibly.
