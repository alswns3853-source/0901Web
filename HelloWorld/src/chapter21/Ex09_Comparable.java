package chapter21;

import java.util.Set;
import java.util.TreeSet;

class Student2 implements Comparable<Student2>{
	private String name;
	private int age;
	public Student2(String name, int age) {
		this.name = name;
		this.age = age;
	}
	@Override
	public String toString() {
		return name + ":" + age;
	}
	@Override
	public int compareTo(Student2 o) {
		return this.age - o.age; // 나이 오름차순
//		return o.age - this.age; // 나이 내림차순
//		return this.name.compareTo(o.name); // 이름 오름차순
//		return o.name.compareTo(this.name); // 이름 내림차순
	}

}

public class Ex09_Comparable {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		TreeSet에 Student2처럼 객체를 저장하는 경우
//		Student2에 반드시 Comparable을 상속하여 compareTo메서드를 구현해 합니다.
//		구현하지 않으면 실행시 에러 발생
		Set<Student2> tree = new TreeSet<>();
		tree.add(new Student2("홍길동",30));
		tree.add(new Student2("전우치",40));
		tree.add(new Student2("손오공",20));
		for(Student2 s : tree) {
			System.out.println(s);
		}
	}

}
