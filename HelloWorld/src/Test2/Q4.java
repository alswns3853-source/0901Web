package Test2;

import java.util.HashMap;
import java.util.Scanner;

public class Q4 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		[문제4] HashMap<String, Integer> 컬렉션을 생성하고 
//		“밀키스”는 700, “코카콜라”는 800, “펩시”는 1000, 
//		“칠성사이다”는 1200을 저장하시오. 
//		그리고 다음과 같이 음료수 이름을 입력받으면 HashMap에서 검색하여 
//		가격을 출력하시오.
//		밀키스, 코카콜라, 펩시, 칠성사이다 있습니다.
//		선택 >> 코카콜라
//		코카콜라는 800원 입니다.
//		선택 >> 칠성사이다
//		칠성사이다는 1200원 입니다.
//		선택 >> 그만
//		종료합니다...
		HashMap<String, Integer> yummy = new HashMap<String, Integer>();
		Scanner sc = new Scanner(System.in);
		System.out.println("밀키스, 코카콜라, 펩시, 칠성사이다 있습니다.");
		yummy.put("코카콜라", 800);
		yummy.put("밀키스", 700);
		yummy.put("칠성사이다", 1200);
		yummy.put("펩시", 1000);

		while (true) {
			System.out.print("선택>> ");
			String st = sc.nextLine();
			if (st.equals("그만")) {
				System.out.println("종료합니다...");
				break;
			}
			if (yummy.containsKey(st)) {
				System.out.println(st + "는 " + yummy.get(st) + "원 입니다.");
			}
		}

	}
}