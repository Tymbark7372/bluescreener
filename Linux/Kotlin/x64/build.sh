#!/bin/bash
# kotlin native
kotlinc-native panic.kt -o panic_x64
# or jvm: kotlinc panic.kt -include-runtime -d panic.jar && java -jar panic.jar

