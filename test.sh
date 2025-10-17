#!/bin/bash

# Script to compile and test Java classes

if [ -z "$1" ]; then
  echo "[ERROR] Usage: $0 test"
  exit 1
fi

# Clear output dirs
./clean.sh

ls bin/

cd src/

pwd

# Compile the Java source file
javac -d ../bin -cp .:../libs/test/* com/javaproject/Main.java com/javaproject/CalculatorTest.java

if [ $? -ne 0 ]; then
  echo "[ERROR] Compilation failed."
  exit 1
fi

echo "[INFO] Compilation success."

cd ../bin

pwd

java -javaagent:../libs/test/org.jacoco.agent-0.8.13-runtime.jar=destfile=jacoco.exec \
-cp .:../libs/test/* org.junit.runner.JUnitCore com.javaproject.CalculatorTest

cd ..

pwd

java -cp "libs/test/*" org.jacoco.cli.internal.Main report bin/jacoco.exec --classfiles bin/ --sourcefiles src/ --html report --xml report/jacoco.xml
