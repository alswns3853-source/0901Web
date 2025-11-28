package chapter12_5;

abstract class Animal{
	abstract void doMove();
}
class Tiger extends Animal{
	@Override
	void doMove() {
		System.out.println("호랑이는 산을 달립니다.");
	}
	void swimming() {
		System.out.println("호랑이가 수영을 합니다.");
	}
}
class Lion extends Animal{
	@Override
	void doMove() {
		System.out.println("사자는 평원을 달립니다.");
	}
	void hunting() {
		System.out.println("사자는 밤에 사냥합니다.");
	}
}

public class Ex04_Polymophism3 {
	
	public static void animalChoose(Animal obj) {
//		obj가 Tiger인지 Lion확인하는 if문
		if(obj instanceof Tiger) {
//			캐스팅을 이용하여 부모클래스 obj를 자식클래스로 변경
			Tiger tiger = (Tiger)obj;
//			부모클래스와 자식클래스 둘다 가지고있는 메서드 이기 때문에 캐스팅이 필요
			tiger.doMove();
//			부모클래스에 없는 자식클래스에만 존재하는 메서드는 캐스팅을 이용하여 변경 후
//			실행을 해야 에러가 없이 실행됨
			tiger.swimming();
		}else {
			Lion lion = (Lion)obj;
			lion.doMove();
			lion.hunting();
		}
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 부모클래스에 담겨있는 자식클래스
//		자식클래스에있는 메서드는 실행할 수 없음
		Animal tiger = new Tiger();
		animalChoose(tiger);
		
		Animal lion = new Lion();
		animalChoose(lion);
		
	}

}
