package chapter16;

import java.util.InputMismatchException;
import java.util.Scanner;

public class Ex09_ThrowsInMethod {

	public static void myMethod1() {
		myMethod2();
	}
//	메서드의 이름 뒤에 throws와 예외의 이름을 클래스를 적으면 예외 미루기 선언
//	try catch문에서 Throwable가 아닌 각각의 Exception으로 처리가 가능해짐
	public static void myMethod2()
		throws ArithmeticException, InputMismatchException{
		Scanner sc = new Scanner(System.in);
		int num1 = sc.nextInt();
		int num2 = 10 / num1;
		System.out.println(num2);
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			myMethod1();
		}catch(ArithmeticException e) {
			System.out.println("0으로 나누면 예외가 발생합니다.");
			e.printStackTrace();
		}catch(InputMismatchException e) {
			System.out.println("문자를 입력하면 예외가 발생합니다.");
			e.printStackTrace();
		}
		System.out.println("--------------------");
	}

}
