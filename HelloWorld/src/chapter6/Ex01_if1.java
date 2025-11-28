package chapter6;

import java.util.Scanner;

public class Ex01_if1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// if 문의 문법
//		if(조건식) {
//			조건식이 true 일때 실행할 코드;
//		}else if(조건식) {
//		    else if(조건식)이 결과가 true 일떄 실행할 코드;
//		}else if(조건식) {
//		    else if(조건식)이 결과가 true 일떄 실행할 코드;
//		}else {
//		    위의 조건식이 false 일때 실행할 코드;
//		}
		Scanner sc = new Scanner(System.in);
		// 90이상 = A
		// 80이상 = B
		// 70이상 = C
		// 60이상 = D
		// 60미만 = F
		System.out.print("점수를 입력해주세요>>");
		int num = sc.nextInt();
		if (num >= 90) {
			System.out.println("A");
		} else if (num >= 80) {
			System.out.println("B");
		} else if (num >= 70) {
			System.out.println("C");
		} else if (num >= 60) {
			System.out.println("D");
		} else {
			System.out.println("F");
		}
		

	}
}
