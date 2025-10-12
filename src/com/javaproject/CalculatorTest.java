package com.javaproject;

import com.javaproject.Calculator;
import org.junit.Test;
import static org.junit.Assert.assertEquals;

public class CalculatorTest {
    @Test
    public void testAdd() {
        Calculator calc = new Calculator();
        assertEquals(5, calc.sumTwoInt(2, 3));
    }
}

