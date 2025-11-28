package con4;

import java.util.Scanner;

public class Ex03 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 예외처리 : try catch문 사용하여 예외가 발생하더라도 
//		           프로그램이 꺼지지 않고 계속 실행되도록 하는 방식
//		try {
//			에러가 발생할 가능성이 있는 코드 작성
//			}catch(Exception e){
//		에러가 발생했을때 실행할 코드 작성
		try {	
			Scanner sc = new Scanner(System.in);
			System.out.print("정수를 입력하세요>>");
			int num = sc.nextInt();
    		if (num %2 == 0) {
    			System.out.println("짝수");
    		}else {
    			System.out.println("홀수");
    		}
		}catch(Exception e) {
			System.out.println("수를 입력하지 않아 프로그램을 종료합니다.");
		}
		System.out.println("정상실행, catch문 실행 둘다 끝나고 나면 실행되는 부분");
	}
}

