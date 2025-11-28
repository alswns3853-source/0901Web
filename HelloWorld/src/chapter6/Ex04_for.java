package chapter6;

public class Ex04_for {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        // for 반복문 : 정해진 횟수를 실행할 때 많이 사용하는 반복문 
//		for(1초기값; 2조건식; 4증감식) {
//			3조건식이 true 일때 실행할 코드;
//		}
//		1부터 5까지 반복하는 반복문
		for(int i=1; i<=5; i++) {
			System.out.println("실행할 코드");
		}
		System.out.println("반복문이 끝났습니다.");
//		1부터 10까지 반복하는 반복문
		for(int i=1; i<=10; i++) {
			System.out.println(i);
		}
		System.out.println("반복문이 끝났습니다.");
		// 100부터 110까지 반복하는 반복문 작성하기
		for(int i=100; i<=110; i++) {
			System.out.println(i);
		}
		System.out.println("반복문이 끝났습니다.");
		//2부터 9까지 반복하는 반복문 작성하기
		for(int i=2; i<=9; i++) {
			System.out.println(i);
		}
		System.out.println("반복문이 끝났습니다.");
		//10부터 1까지 반복하는 반복문 작성하기
		for(int i=10; i>=1; i--) {
			System.out.println(i);
		}
		System.out.println("반복문이 끝났습니다.");
		//5,10,15를 출력하는 반복문 작성하기
		for(int i=5; i<=15; i+=5) {
			System.out.println(i);
		}
		System.out.println("반복문이 끝났습니다.");
	}

}
