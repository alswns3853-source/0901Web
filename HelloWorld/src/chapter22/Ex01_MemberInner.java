package chapter22;

// 외부 클래스 : 일반적으로 생성하는 클래스
class Outer1{
	private int speed = 10;
// 	멤버 내부 클래스 : 외부 클래스에서만 사용하는 편의를 위해 만드는 클래스
	class MemberInner1{
		public void move() {
			System.out.println("인간형 유닛이 "+speed+"속도로 이동합니다.");
		}
	}
//	외부 클래스의 메서드
	public void getMarine() {
//		내부 클래스의 메서드를 사용하려면 선언해야함
		MemberInner1 inner = new MemberInner1();
//		내부 클래스 메서드 실행
		inner.move();
	}
}

public class Ex01_MemberInner {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		일반적인 클래스 선언 방식
		Outer1 out = new Outer1();
		out.getMarine();
//		내부 멤버 클래스 선언방식
		Outer1.MemberInner1 inner = out.new MemberInner1();
		inner.move();
	}

}
