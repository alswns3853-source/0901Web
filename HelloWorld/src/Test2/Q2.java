package Test2;

import java.util.Scanner;
import java.util.StringTokenizer;

public class Q2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//	[문제2] Scanner를 이용하여 한 라인을 읽고, ,(콤마)로 
//	분리된 어절이 몇 개인지 출력을 반복하는 프로그램을 작성하시오. 
//	“exit”이 입력되면 종료한다.
//	apple, orange, banana, strawberry
//	어절 개수는 4
//	사과, 오렌지, 바나나
//	어절 개수는 3
//	exit
//	종료합니다..
		Scanner sc = new Scanner(System.in);

		while (true) {
			String a = sc.nextLine();
			if (a.equals("exit")) {
				System.out.println("종료합니다...");
				break;
			}

			StringTokenizer st = new StringTokenizer(a, " ");
			System.out.println("어절 개수는 " + st.countTokens());
			System.out.println("어절 개수는 " + a.split(", ").length);
		}
	}
}
