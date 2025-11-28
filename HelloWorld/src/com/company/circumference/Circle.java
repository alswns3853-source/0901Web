package com.company.circumference;

public class Circle {
	double rad;
	final double PI;
	public Circle(double r) {
		rad = r;
		PI = 3.14;
	}
	//원의 둘레 길이 반환
	public double getCircumference() {
		return (rad * 2) * PI;
	}
}
