package common;

public class Person {
//	자바 빈즈 dto,vo 생성 규약
//	1. 멤버 변수는 private로 설정
//	2. 반드시 생성자를 작성
//	3. Getter, Setter 작성
	private String name;
	private int age;
	
	public Person() {}


	public Person(String name, int age) {
		this.name = name;
		this.age = age;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}
}
