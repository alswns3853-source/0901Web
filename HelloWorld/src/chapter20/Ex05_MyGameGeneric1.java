package chapter20;

class Npc5 {
	@Override
	public String toString() {
		return "This is Npc5.";
	}
}
class Tank5 {
	@Override
	public String toString() {
		return "This is Tank5.";
	}
}
//class 클래스이름<제네릭타입>{
//	제네릭타입 매개변수 이름 규칙
// 	1. 한글자로 이름 짓기
//	2. 대문자로 이름 짓기
//	대표적으로 사용되는 문자 :E(Element), K(Key), N(Number), T(Type), V(Value)
//}
class Camp5<T> {
//	제네릭으로 설정한 T는 멤버 변수, 메서드에서 자료형으로 사용 가능
	private T unit;
    public void set(T unit) {
		this.unit = unit;
	}
	public T get() {
		return unit;
	}
}
public class Ex05_MyGameGeneric1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		기본자료형(보라색 자료형)은 제네릭에 사용할 수 없음
//		클래스이름<자료형> 변수이름 = new 클래스이름<>();
		Camp5<Npc5> human = new Camp5<>();
		Camp5<Tank5> tank = new Camp5<>();
//		Camp<int> intTest = new Camp5<>(); int는 기본 자료형이기 때문에 에러 발생
//		숫자를 사용하려면 int대신 Integer를 사용하자
		Camp5<Integer> integerTest = new Camp5<>();

//		Camp5<Npc5>로 설정했기 때문에 Npc5만 저장할 수 있도록 변경됨
		human.set(new Npc5());
//		human.set(new Tank5()); Tank5는 human에 저장시 에러를 발생 시킴
		tank.set(new Tank5());
//		tank.set(new Npc5()); Npc5는 tank에 저장시 에러를 발생 시킴
		
		Npc5 hUnit = human.get();
		Tank5 mUnit = tank.get();
		
		System.out.println(hUnit);
		System.out.println(mUnit);
	}

}
