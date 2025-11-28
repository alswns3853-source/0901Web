package chapter21;

import java.util.HashSet;

class Student{
	String name;
	int age;
	public Student(String name, int age) {
		this.name = name;
		this.age = age;
	}
	@Override
	public String toString() {
		return name + ":" + age;
	}
	@Override
//	Set에 데이터 저장시 hashCode를 확인하여 같으면 eqauls를 실행하고
//	equals의 결과가 true라면 데이터를 저장하지 않는다.
	public int hashCode() {
//		int num =age % 3;
//		System.out.println("데이터 저장 "+age+" %3: "+num);
//		name, age 변수를 사용하여 해쉬코드를 생성하는 메서드
		int num = java.util.Objects.hash(name,age);
		System.out.println(num);
		return num;
	}
	@Override
	public boolean equals(Object obj) {
		System.out.println(age+"=="+((Student)obj).age + "비교를 합니다.");
		if(age == ((Student)obj).age) {
			return true;
		}else {
			return false;
		}
	}
}

public class Ex07_HashSetEqual {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		HashSet<Student> set = new HashSet<>();
		set.add(new Student("홍길동", 20));
		set.add(new Student("전우치", 20));
		set.add(new Student("홍길동", 25));
		set.add(new Student("이순신", 25));
		set.add(new Student("이순신", 25));
		
		System.out.println("객체 수:" + set.size());
		
		for(Student s : set) {
			System.out.print(s.toString() + '\t');
		}
		System.out.println();
	}

}
