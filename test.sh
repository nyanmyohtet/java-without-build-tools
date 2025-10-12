#!/bin/bash

# Script to compile and test Java classes

# Clear `bin` dir
./clean.sh

ls bin/

cd src/

pwd

# Compile the Java source file
javac -d ../bin -cp .:../libs/* com/javaproject/CalculatorTest.java

if [ $? -ne 0 ]; then
  echo "Compilation failed."
  exit 1
fi

echo "Compilation success."

cd ../bin

pwd

java -cp .:../libs/* org.junit.runner.JUnitCore com.javaproject.CalculatorTest
