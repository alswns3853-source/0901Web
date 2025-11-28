package Test1;

import java.util.Scanner;

public class Q1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//	[문제1] 작성할 클래스명: NumberGame
//	컴퓨터가 임의로 정한 수를 맞추는 게임을 만들어 봅니다. 
//	1에서 100까지의 수 중에서 임의의 수를 
//	컴퓨터가 정하고 사람은 이 수를 맞출 때까지 게임을 반복합니다. 
//	짝수인지 홀수인지 힌트를 주고 시작하며, 
//	사용자가 입력한 값보다 크면 “더 큰 수입니다.”를 출력하고, 
//	사용자가 입력한 값보다 작으면 “더 작은 수입니다.”를 출력합니다. 
//	사용자가 입력한 값이 컴퓨터가 정한 수와 일치하면 
//	입력 시도한 횟수와 함께 “몇회만에 맞췄습니다.”를 출력하고 게임을 종료합니다.
//  === 숫자맞추기 게임을 시작합니다. ===
//	컴퓨터가 숫자를 생각했습니다.
//	힌트는 홀수입니다.
//	1~100 사이의 값을 입력 >> 5
//	더 큰 수입니다.
//	1~100 사이의 값을 입력 >> 77
//	더 작은 수입니다.
//	1~100 사이의 값을 입력 >> 27
//	3회 만에 맞췄습니다.
//	=== 게임을 종료합니다. ===
		System.out.println("=== 숫자맞추기 게임을 시작합니다. ===");
		System.out.println("컴퓨터가 숫자를 생각했습니다.");
		Scanner sc = new Scanner(System.in);
		int number = (int) (Math.random() * 100 + 1);
		String str = number%2 == 0 ? "짝수" : "홀수" ;
		System.out.println("힌트는 "+str+"입니다.");
		int count = 0;

		while (true) {
			System.out.print("1~100 사이의 값을 입력 >>");
			int input = sc.nextInt();
			if (input > number) {
				System.out.println(" 더 작은 수입니다.");
			} else if (input < number) {
				System.out.println(" 더 큰 수 입니다.");
			} else if (input == number) {
				System.out.println(count + "회 만에 맞췄습니다.");
				System.out.println("=== 게임을 종료합니다. ===");
				break;
			}
			count++;
		}

	}

}
