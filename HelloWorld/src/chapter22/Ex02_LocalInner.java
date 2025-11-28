package chapter22;


//외부 클래스 : 일반적으로 생성하는 클래스
class HumanCamp2{
	private int speed = 10;
//	외부 클래스의 메서드
	public void getMarine() {
//		지역 내부 클래스 (로컬 이너 클래스) : 해당 메서드 안에서 쓸 수 있는 클래스
		class Marine2{
			public void move() {
				System.out.println("인간형 유닛이 "+speed+"속도로 이동합니다.");
			}
		}
//		내부 클래스의 메서드를 사용하려면 선언해야함
		Marine2 inner = new Marine2();
//		내부 클래스 메서드 실행
		inner.move();
	}
}
public class Ex02_LocalInner {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		HumanCamp2 hc = new HumanCamp2();
		hc.getMarine();
	}

}
