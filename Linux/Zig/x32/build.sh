#!/bin/bash
zig build-exe panic.zig -target x86-linux-gnu -O ReleaseSmall
mv panic panic_x86

