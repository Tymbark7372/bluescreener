#!/bin/bash
zig build-exe panic.zig -target x86_64-linux-gnu -O ReleaseSmall
mv panic panic_x64

