package Test2;

import java.util.HashMap;
import java.util.Scanner;

public class Q3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//	[문제3]고객의 이름과 통장 잔액을 관리하는 프로그램을 해시맵을 이용하여 작성하시오. 
//		  이 프로그램은 고객의 이름과 잔액을 누적하여 관리한다. 
//		  한 고객의 입력이 끝나면 현재까지의 모든 고객의 통장 잔액을 출력한다.
//	<< 통장 관리 프로그램입니다. >>
//	이름과 금액 입력>> 홍길동 45000
//	(홍길동>45000원) 
//	이름과 금액 입력>> 김철수 2800
//	(홍길동>45000원)(김철수>2800원)
//	이름과 금액 입력>> 홍길동 500
//	(홍길동>45500원)(김철수>2800원)
//	이름과 금액 입력>> 김철수 1800
//	(홍길동>45500원)(김철수>4600원)
//	이름과 금액 입력>> exit
//	프로그램을 종료합니다...
		HashMap<String, Integer> map = new HashMap<>();
		Scanner sc = new Scanner(System.in);
		System.out.println("<< 통장 관리 프로그램입니다. >>");
		while (true) {
			System.out.println("이름과 금액 입력>> ");
			String input = sc.nextLine();
			if (input.equals("exit")) {
				System.out.println("종료합니다...");
				break;
			}
			String[] s = input.split(" ");
            String name = s[0];
            int a = Integer.parseInt(s[1]); // 숫자 변환 (예외 처리 없음)

            
            map.put(name, map.getOrDefault(name, 0) + a);

            
            for (String key : map.keySet()) {
                System.out.print("(" + key + ">" + map.get(key) + "원)");
            }
		System.out.println();

				
			}
		}
	}


