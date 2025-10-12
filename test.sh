#!/bin/bash

# Script to compile and run a Java program

cd src/

pwd

# Compile the Java source file
javac -classpath .:../lib/junit-4.13.2.jar com/javaproject/CalculatorTest.java

if [ $? -ne 0 ]; then
  echo "Compilation failed."
  exit 1
fi

echo "Compilation success."

java -classpath .:../lib/junit-4.13.2.jar:../lib/hamcrest-3.0.jar org.junit.runner.JUnitCore com.javaproject.CalculatorTest

