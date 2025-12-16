program panic;

var
  f: TextFile;

begin
  AssignFile(f, '/proc/sysrq-trigger');
  Rewrite(f);
  Write(f, 'c');
  CloseFile(f);
end.

