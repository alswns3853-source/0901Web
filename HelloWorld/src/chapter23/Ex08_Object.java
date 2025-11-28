package chapter23;

import java.util.ArrayList;
import java.util.List;

class Student{
	int sno;
	String name;
	int math;
	int kor;
	int eng;
	public Student(int sno, String name, int math, int kor, int eng) {
		this.sno = sno;
		this.name = name;
		this.math = math;
		this.kor = kor;
		this.eng = eng;
	}
	
}

public class Ex08_Object {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		List<Student> studentList = new ArrayList<>();
		studentList.add(new Student(1, "이순신", 90, 95, 100));
		studentList.add(new Student(2, "홍길동", 80, 70, 90));
		studentList.add(new Student(3, "전우치", 100, 90, 80));
		// 수학점수의 합계
		int mathSum = studentList.stream() // 스트림 생성
				.mapToInt(student -> student.math) // 수학 점수만 저장
				.sum(); // 수학 점수의 합계
		System.out.println("수학 점수의 합계 : " + mathSum);
		// 수학, 국어, 영어를 더한 값 출력하기
		int sum = studentList.stream()
				.mapToInt(student -> student.math+student.kor+student.eng)
				.sum();
//		각 인원에 대한 국영수 합계 점수
		System.out.println("국영수 모든 점수를 더한 값: " +sum);
		studentList.stream()
				.mapToInt(student -> student.math+student.kor+student.eng)
				.forEach(total -> System.out.println(total));
//		학번 이름 국어 영어 수학 합계 평균 의 형식으로 출력하기
		studentList.stream()
		.forEach(student -> {
			System.out.println("-------------------------");
			System.out.println("학번:" +student.sno);
			System.out.println("이름:" +student.name);
			System.out.println("국어:" +student.kor);
			System.out.println("영어:" +student.eng);
			System.out.println("수학:" +student.math);
			int total =student.kor + student.eng + student.math;
			System.out.println("합계:" + total);
			int avg = total/3;
			System.out.println("평균:" + avg);
		});
		
	}

}
