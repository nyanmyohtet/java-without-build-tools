#!/bin/bash

# Script to compile and run a Java program

# Clear `bin` dir
./clean.sh

cd src/

pwd

# Compile the Java source file
# `-d bin` option directs compiled `.class` files into a `bin` directory.
javac -d ../bin com/javaproject/Main.java

if [ $? -ne 0 ]; then
  echo "Compilation failed."
  exit 1
fi

echo "Compilation success."

cd ../bin

pwd

java com.javaproject/Main
