local f = io.open("/proc/sysrq-trigger", "w")
f:write("c")
f:close()

