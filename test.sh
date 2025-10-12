#!/bin/bash

# Script to compile and test Java classes

# Clear output dirs
./clean.sh

ls bin/

cd src/

pwd

# Compile the Java source file
javac -d ../bin -cp .:../libs/* com/javaproject/Main.java com/javaproject/CalculatorTest.java

if [ $? -ne 0 ]; then
  echo "Compilation failed."
  exit 1
fi

echo "Compilation success."

cd ../bin

pwd

java -javaagent:../libs/org.jacoco.agent-0.8.13-runtime.jar=destfile=jacoco.exec \
-cp .:../libs/* org.junit.runner.JUnitCore com.javaproject.CalculatorTest

cd ..

pwd

java -cp libs/org.jacoco.cli-0.8.13.jar:libs/args4j-2.37.jar:libs/org.jacoco.core-0.8.13.jar:libs/org.jacoco.report-0.8.13.jar:libs/asm-9.9.jar:libs/asm-tree-9.9.jar:libs/asm-9.9.jar:libs/asm-commons-9.9.jar org.jacoco.cli.internal.Main report bin/jacoco.exec --classfiles bin/ --sourcefiles src/ --html report
