package chapter16;

import java.util.InputMismatchException;
import java.util.Scanner;

public class Ex04_CatchConcat {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		System.out.print("숫자를 입력하세요>>");
		try {
			int num1 = sc.nextInt();
			int num2 = 10 / num1;
			System.out.println("10/"+num1+"="+num2);
//			여러개의 예외를 한번에 처리하도록 하는 예외 합치기
//			|(Or기호)를 이용하여 Exception을 연속으로 작성하기
		}catch(InputMismatchException | ArrayStoreException e) {
			System.out.println("문자열을 입력하거나 0을 입력하지마세요.");
//			예외의 내용과 어떤 코드에서 예외가 발생했는지 보여주는 메서드
			e.printStackTrace();
//			예외의 설명 출력하는 메서드
			System.out.println(e.getMessage());
		}catch(Exception e) {
			System.out.println("위에 적지 않은 모든 예외를 처리하는 부분");
		}
		System.out.println("Good bye~~!");
	}

}
