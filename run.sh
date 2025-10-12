#!/bin/bash

# Script to compile and run a Java program

cd src/

pwd

# Compile the Java source file
javac com/javaproject/Main.java

if [ $? -ne 0 ]; then
  echo "Compilation failed."
  exit 1
fi

echo "Compilation success."

java com.javaproject/Main
