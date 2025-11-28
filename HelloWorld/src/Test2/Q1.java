package Test2;

import java.util.Scanner;

class Circle {
	private int radius;

	public Circle(int radius) {
		this.radius = radius;
	}

	public double getArea() {
		return radius * radius * 3.14;
	}
}

class CircleArray {
	private Circle[] circles;

	public CircleArray() {
		circles = new Circle[4];
	}

	public void input() {
		Scanner sc = new Scanner(System.in);
		for (int i = 0; i < circles.length; i++) {
			System.out.print((i + 1) + " 반지름>>");
			int r = sc.nextInt();
			circles[i] = new Circle(r);
		}
	}
		public double getTotal() {
	        double sum = 0;
	        for (int i = 0; i < circles.length; i++) {
	            sum += circles[i].getArea();
	        }
	        return sum;
	}
}

public class Q1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//[문제1] 원을 표현하는 다음 Circle 클래스를 활용하여, Circle 객체 배열을 생성하고, 
//		사용자로부터 4개의 반지름을 입력받아 배열에 저장한 뒤, 
//		배열을 검색하여 원 면적의 합을 출력하는 
//		main() 메소드를 가진 CircleArray 클래스를 작성하시오.
//  class Circle {
//	private int radius;
//	
//	public Circle(int radius) { 
//		this.radius = radius;
//	}
//	
//	public double getArea() { 
//		return radius*radius*3.14; 
//	}
//}
//  1 반지름 >> 25
//2 반지름 >> 4
//3 반지름 >> 71
//4 반지름 >> 30
//저장하였습니다...
//원의 면적 전체 합은 20667.48
		Scanner sc = new Scanner(System.in);
		CircleArray circleArray = new CircleArray();
		circleArray.input();
		 double total = circleArray.getTotal();
		 System.out.println("저장하였습니다...");
		 System.out.println("원의 면적 전체 합은 " + total);
	}

}
