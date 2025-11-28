package chapter12;

class Unit {
	// 맴버 변수
	String name;
	int hp;
	int mp;

	// 생성자
	Unit(String name, int hp, int mp) {
		this.name = name;
		this.hp = hp;
		this.mp = mp;
	}

	// 메서드
	void doMove() {
		System.out.println();
		System.out.println(name + "가 이동속도 10으로 이동");
	}

	// 메서드
	void printUnit() {
		System.out.print("이름:" + name + ", HP:" + hp + ", MP:" + mp);
	}

	void doFireAttack() {
		System.out.println("화염공격!");
	}

// 상속 방식 : class 클래스이름 extends 상속받을클래스{}
// name,hp,mp변수와 doMove(),printUnit()메서드를
// 선언하지 않아도 사용할 수 있음.
class Marine extends Unit {
	int attack;

//	자식 클래스의 생성자는 부모 클래스의 생성자가 있으면 반드시 실행해야함
	Marine(String name, int hp, int mp, int attack) {
//		super() : 부모클래스의 생성자를 의미
		super(name, hp, mp);
//		marine클래스의 맴버변수 attack를 설정
		this.attack = attack;
	}

	void printMarine() {
//		부모 클래스의 메서드는 자식클래스에서 자유롭게 사용할 수 있음.
		printUnit();
		System.out.println(", 공격력:" + attack);
//		부모 클래스의 맴버 변수는 자식클래스에 자유롭게 사용할 수 있음.
		System.out.println(name + "," + hp + "," + mp + "," + attack);
	}
}

class Medic extends Unit {
	int heal = 5;

	Medic(String name, int hp, int mp, int heal) {
//		부모에 있는 생성자를 실행하는 super()
//		부모클래스에 생성자가 있다면 자식클래스에서 반드시 실행해야함.
		super(name, hp, mp);
		this.heal = heal;
	}

//	오버라이딩 : 부모클래스에 있는 doMove()의 실행 내용을 변경, 추가 할때 사용
	void doMove() {
		System.out.println();
		System.out.println(name + "가 이동속도 8으로 이동");
	}

	void printMedic() {
		printUnit();
		System.out.println(", 회복력:" + heal);
	}
}

//FireBat클래스 만들기
class Firebat extends Unit {
	int fireAttack = 5;

	Firebat(String name, int hp, int mp, int fireAttack) {
		super(name, hp, mp);
		this.fireAttack = fireAttack;
	}

	@Override // 오버라이드 된 메서드인 것을 표시하는 문구
//	@Override 적어서 오버라이딩 문법에 맞는지 확인하고 
//	문법이 맞지 않으면 에러를 발생시킴, 오버라이딩 시 반드시 적는것이 궈낮ㅇ됨
	void doMove() {
//		super.부모클래스의메서드() : 부모클래스의 메서드를 실행함.
		super.doMove();
		System.out.println("파이어벳이 스팀팩을 사용하면 12의 이동속도로 이동합니다.");
	}

	void printFirebat() {
		printUnit();
		System.out.println(", 화염공격:" + fireAttack);
	}
}

public class Ex01_MyTerran {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Marine unit1 = new Marine("마린", 50, 0, 0);
		unit1.name = "마린";
		// name, hp, mp 세가지 변수는 Unit클래스를 상속 받아 사용
		unit1.hp = 100;
		unit1.mp = 0;
		// attack변수는 Marine클래스에서 선언하여 사용
		unit1.attack = 20;
		unit1.doMove();
		unit1.printMarine();
		unit1.printUnit();
		System.out.println();

		Medic unit2 = new Medic("메딕", 120, 100, 0);
		// attack변수는 Marine클래스에서 선언하여 사용
		unit2.doMove();
		unit2.printMedic();

		Firebat unit3 = new Firebat("화염", 60, 200, 100);
		unit3.doMove();
		unit3.printFirebat();
		unit3.doFireAttack();
	}
 }
}
