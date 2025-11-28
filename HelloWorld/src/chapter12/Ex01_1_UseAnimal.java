package chapter12;

class Animal {
	// 멤버 변수 : name, age
	// 메서드 : eat(), move()
	String name;
	int age;

	Animal(String name, int age) {
		this.name = name;
		this.age = age;
	}
    void printAnimal() {
    	System.out.println("이름:"+name+", 나이:"+age);
    }
	void eat() {
		System.out.println("먹습니다.");
	}

	void move() {
		System.out.println(name + "가 움직입니다.");
	}
	// 메서드 : meow() : 고양이가 야옹하고 웁니다.
	void meow() {
		System.out.println("고양이가 야옹하고 웁니다.");
	}
	// 메서드 : bark() : 강아지가 멍멍하고 짖습니다.
	void bark() {
		System.out.println("강아지가 멍멍하고 짖습니다.");
	}
}

class Cat extends Animal {
	
	
	Cat(String name, int age) {
		super(name, age);
		// TODO Auto-generated constructor stub
	}
	void printCat() {
		printAnimal();
		System.out.println(name+","+age);
	}
	// eat()메서드를 오버라이딩하여 고양이는 천천히 먹습니다 출력하도록 변경
	void eat() {
		System.out.println(name+"는 천천히 먹습니다.");
	}
	// move()메서드를 오버라이딩하여 고양이는 조용히 움직입니다 출력하도록 변경
	void move() {
		System.out.println(name+"는 조용히 움직입니다.");
	}
    
}

class Dog extends Animal {
	Dog(String name, int age) {
		super(name, age);
		// TODO Auto-generated constructor stub
	}
	void printDog() {
		printAnimal();
		System.out.println(name+","+age);
	}
	@Override
	void eat() {
		// TODO Auto-generated method stub
		super.eat();
		System.out.println("주인이 허락하면 먹습니다.");
	}
	@Override
	void move() {
		// TODO Auto-generated method stub
		super.move();
		System.out.print("산책할때는 더 빠르게 움직입니다.");
	}
//	eat()를 실행하면 아래 내용이 출력되도록 설정하기
//	먹습니다.
//	주인의 허락이 떨어져야먹습니다.
//	move()를 실행하면 아래 내용이 출력되도록 설정하기
//	움직입니다.
//  산책할때는 더 빠르게 움직입니다.
}

public class Ex01_1_UseAnimal {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Cat Animal1 = new Cat("고양이",7);
		Animal1.meow();
		Animal1.printAnimal();
		Animal1.eat();
		Animal1.move();
		System.out.println();
		
		Dog Animal2 = new Dog("개",10);
		Animal2.bark();
		Animal2.printAnimal();
		Animal2.eat();
		Animal2.move();
	}
     	
     	
}
