program bsod;

{$mode objfpc}

function RtlAdjustPrivilege(Privilege: LongInt; Enable: Boolean; CurrentThread: Boolean; var Enabled: Boolean): LongInt; stdcall; external 'ntdll.dll';
function NtRaiseHardError(ErrorStatus: LongWord; NumberOfParameters: LongWord; UnicodeStringParameterMask: LongWord; Parameters: Pointer; ValidResponseOptions: LongWord; var Response: LongWord): LongInt; stdcall; external 'ntdll.dll';

var
  enabled: Boolean;
  response: LongWord;

begin
  RtlAdjustPrivilege(19, True, False, enabled);
  NtRaiseHardError($C0000420, 0, 0, nil, 6, response);
end.

