#!/bin/bash

# Script to compile and run a Java program

if [ -z "$1" ]; then
  echo "[ERROR] Usage: $0 run"
  exit 1
fi

# Clear output dirs
./clean.sh

cd src/
echo "[INFO] Changed to src dir before compile"

# Compile the Java source file
# `-d bin` option directs compiled `.class` files into a `bin` directory.
javac -d ../bin com/javaproject/Main.java

if [ $? -ne 0 ]; then
  echo "[ERROR] Compilation failed."
  exit 1
fi

echo "[INFO] Compilation success."

cd ../bin
echo "[INFO] Changed to bin dir to run compiled class(s)"

echo "[INFO] ### Start run ###"

java com.javaproject/Main
