package com.javaproject;

import com.javaproject.Calculator;

public class Main {
	public static void main(String[] args) {
		System.out.println("Start Main...");
		run();
	}

	private static void run() {
		Calculator cal = new Calculator();
		int sum = cal.sumTwoInt(1, 2);	
		System.out.println("sum: " + sum);
	}
}
