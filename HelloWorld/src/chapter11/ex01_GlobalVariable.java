package chapter11;
class Cat{
	// static변수 : main이 실행되기 전부터 생성되는 변수
	// Cat클래스를 생성자를 이용하여 생성하지 않아도 사용할 수 있음.
	static int a = 5;
	// 일반 맴버 변수 : Cat클래스를 생성자를 이용하여 
    //				생성하지 않으면 사용할 수 없는 변수
	int num = 3;
//	일반 메서드 : static변수, 맴버변수 둘다 자유롭게 사용가능
	void printValue(int num) {
		// 맴버 변수 변경
		this.num = num;
		// 맴버 변수 출력 
		System.out.println("num:"+ this.num);
//		스태틱 변수 변경
		a = 15;
//		스태틱 변수 출력
		System.err.println("a:" + a);
	}
	// static 메서드 : 유틸성 메서드를 만드는데 자주 사용되는 기능
	static void princValue(int var) {
		// 맴버변수는 메서드 메모리에 있는 static메서드 안에서 사용할 수 없음
		// 맴버변수는 객체가 만들어져 있어야(힙메모리에 있어야) 사용할 수 있지만
		// static메서드는 객체가 만들어지기 전에 이미 메모리에 올라가 있기 때문에 사용할 수 없음
//		System.out.println("맴버 변수 num의 값:"+num);
		System.out.println("static변수 a의 값:"+a);
		System.out.println("매개 변수 var의 값:"+var);
//		대표적으로 사용하는 static메서드
		System.out.println("아무런 객체 생성 없이 사용할 수 있는 메서드"); 
		//Mate클래스안에 random()메서드가 static으로 설정되어 객체 생성없이 사용 가능
		System.out.println(Math.random());
	}
}
public class ex01_GlobalVariable {

	public static void main(String[] args) {
		System.out.println(Cat.a);
		// TODO Auto-generated method stub
		int num1 = 5; // 지역 변수(스택 메모리에 저장되는 변수)
		int num2 = 2; // 지역 변수
		System.out.println(num1 + "," + num2);
		
		// 클래스를 인스턴스화, 클래스를 생성자 이용하여 생성한다.
		Cat cat1 = new Cat(); // 힙 메모리 저장되는 객체(인스턴스)
		cat1.num = 1; // 힙 메모리에 저장되는 개체 안에 들어있는 맴버 변수
		cat1.a = 10; // 메서드 메모리에 저장되어 잇는 static변수
		Cat.a = 10; // 위의 cat1.a보다 클래스이름을 사용하는 방식을 더 많이 사용
		cat1.printValue(cat1.num);
		System.out.println(cat1.a);
		
		Cat cat2 = new Cat();
		cat2.num = 2;
		cat2.a = 11;
		cat2.printValue(cat2.num);
//		cat1.a, cat2.a , Cat.a 세가지 전부다 같은 static변수를 출력하는 코드 입니다.
//		cat2.a의 데이터를 변경하면 cat1.a와 Cat.a도 똑같이 변경됨
//		실제로는 이름만 다를 뿐 다 같은 데이터를 쓰고있기 때문 입니다.
		System.out.println(cat2.a); // 사용하지 않는 방식
		System.out.println(cat1.a); // 사용하지 않는 방식
		System.out.println(Cat.a); // static변수를 사용하는 올바른 방

	}

}
