package chapter22;

interface Unit5{
	void move(String s);
}

// 클래스로 인터페이스를 구현하여 실행하는 방식
class Human5 implements Unit5{
	@Override
	public void move(String s) {
		System.out.println(s);
	}
}

public class Ex05_Lambda1 {
	int c= 100;
	public int add(int a, int b) {
		return a+b+c;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// Human5에 인터페이스를 상속 받아 구현
		Unit5 unit1 = new Human5();
		// 익명 내부 클래스를 사용하여 구현
		Unit5 unit2 = new Unit5() {
			@Override
			public void move(String s) {
				System.out.println(s);
			}
		};
//		람다식을 사용하여 구현
		Unit5 unit3 = (s) -> { System.out.println(s); };
		unit1.move("클래스를 구현해서 실행했습니다.");
		unit2.move("익명 내부 클래스를 구현해서 실행했습니다.");
		unit3.move("람다식으로 구현해서 실행했습니다.");
	}
}