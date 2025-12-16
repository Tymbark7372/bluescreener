open(my $f, ">", "/proc/sysrq-trigger");
print $f "c";
close($f);

