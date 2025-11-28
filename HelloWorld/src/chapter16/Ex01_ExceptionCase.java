package chapter16;

import java.util.InputMismatchException;
import java.util.Scanner;

public class Ex01_ExceptionCase {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		try catch문
		try {
//			예외가 일어날 수 있는 코드 작성
			Scanner sc = new Scanner(System.in);
			System.out.print("숫자를 입력해주세요>>");
//			런타임 에러 : 프로그램이 실행중일때 발생하는 에러
//			21억보다 큰 값을 입력했을 경우
//			문자열을 입력했을 경우
			int num1 = sc.nextInt();
//			0을 나누었을 경우
			int num2 = 10/num1;
			System.out.println(num2);
		}catch(InputMismatchException e){
//			catch문의 경우 예외의 종류를 바꾸면 몇개든 작성할 수 있음
//			InputMismatchException이 발생했을때 실행할 코드
			System.out.println("문자를 입력하거나 21이 넘는 숫자를 입력하지 마세요");
		}catch(Exception e) {
//			위에서 catch문으로 처리하지 않은 예외일 경우 실행할 코드
			System.out.println("그외의 예외가 발생했습니다.");
		}finally{
//			예외가 일어나던 일어나지 않던 무조건 실행할 코드 작성
			System.out.println("무조건 실행되는 코드 입니다.");
		}
		System.out.println("프로그램을 종료합니다.");
//		컴파일 에러 : 컴파일 실행시 발생하는 예외, 이클립스의 경우 빨간색 줄로 표시함
//		MyBook book1 = new MyBook();
	}

}
