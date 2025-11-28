package chapter16;

import java.util.Scanner;

public class Ex08_WhyThrow {
	public static void myMethod1() {
		try {
			myMethodA();
		}catch(Throwable e) {
			System.out.println("에러!!!");
		}
	}
	public static void myMethod2() {
		try {
			myMethodA();
		}catch(Throwable e) {
			System.out.println("Error!!!");
		}
	}
//  예외 미루기를 이용하여 같은 코드를 여러번 작성하지 않도록 설정
	public static void myMethodA() {
		Scanner sc = new Scanner(System.in);
		int num1 = sc.nextInt();
		int num2 = 10/num1;
		System.out.println(num2);
	}
	public static void myMethodB() {
		Scanner sc = new Scanner(System.in);
		int num1 = sc.nextInt();
		int num2 = 10/num1;
		System.out.println(num2);
	}
	public static void myMethodC() {
		Scanner sc = new Scanner(System.in);
		int num1 = sc.nextInt();
		int num2 = 10/num1;
		System.out.println(num2);
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		미루기를 이용하여 메서드에서 일어날 예외의 처리 결과를 다르게 실행하기
		myMethod1();
		myMethod2();
		
//		미루기를 이용하여 하나의 try catch문으로 예외처리하기
		try {
			myMethodA();
			myMethodB();
			myMethodC();
		}catch(Throwable e) {
			System.out.println("myMethodA,B,C 중에서 예외 발생");
		}
	}

}
