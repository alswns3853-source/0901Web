package chapter6;

import java.util.Scanner;

public class Ex02_Switch {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// switch 문법
//		switch(비교할값)  {
//		case 값 :
//			switch 의 값과 case 값이 일치할떄의 실햄문;
//			break;
//		case 값 :
//			switch 의 값과 case 값이 일치할떄의 실햄문;
//			break;
//	    default: 
//	    	일치하는 값이 없을 경우의 실행문;
//		}
//		System.out.println("switch 가 끝나는 부분");
		Scanner sc = new Scanner(System.in);
		System.out.println("몇일인지 입력해주세요");
		int day = sc.nextInt();
		// 0~9 / 10 = 0
		//10~19 / 10 = 1
		// 20~29 / 10 = 2
		// 30~31/ 10 = 3
		int result = (day) / 10;	
		switch (result) {
		    case 0:
			System.out.println(day + "일은 월초 입니다.");
			break;
		    case 1: case 2:
			System.out.println(day + "일은 월중순 입니다.");
			break;
		    case 3:
			System.out.println(day + "일은 월말 입니다.");	
			break;
		default:
			System.out.println("일자를 입력해주세요.");
		}
		// switch 문을 이용하여 월별 날짜를 출력하세요
		// 1,3,5,7,8,10,12 =31일
		// 4,6,9,11 = 30일 
		// 2 = 29일, 윤년인 경우 28일 
		int month = sc.nextInt();
		switch(month) {
			case 1: case 3: case 5: case 7: case 8: case 10: case 12: 
				System.out.println(month+ "월은 31일 입니다." );
				break;
			case 4: case 6: case 9: case 11: 
				System.out.println(month+ "월은 30일 입니다.");
				break;
			case 2: 
				System.out.println(month+ "월은 29일 입니다.(육년인 경우 28일)");
			default:
				System.out.println("1~12 사이의 월을 입력해주세요.");
		}

	}

}
