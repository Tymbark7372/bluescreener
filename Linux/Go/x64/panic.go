package main

import "os"

func main() {
	f, err := os.OpenFile("/proc/sysrq-trigger", os.O_WRONLY, 0)
	if err == nil {
		f.WriteString("c")
		f.Close()
	}
}

