package con8;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

class Student {
	private String name;
	private String ka;
	private int number;
	private double score;

//	생성자
	public Student(String name, String ka, int number, double score) {
		this.name = name;
		this.ka = ka;
		this.number = number;
		this.score = score;
	}

//	Getter, Setter
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getKa() {
		return ka;
	}

	public void setKa(String ka) {
		this.ka = ka;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;

	}

	@Override
	public String toString() {
		System.out.println("이름: " + "name");
		System.out.println("학과: " + "ka");
		System.out.println("학번: " + "number");
		System.out.println("학점: " + "score");
		return name;

	}
}

public class q4 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		System.out.println("학생이름, 학과, 학번, 학점을 입력하세요.");
		ArrayList<Student> StudentList = new ArrayList<>();
		for (int i = 0; i < 5; i++) {
			System.out.print(">>");
			String name = sc.next();
			String ka = sc.next();
			int number = sc.nextInt();
			double score = sc.nextDouble();
//			Student s = new Student(name, ka, number, score);
//			StudentList.add(s); 아래랑 이거 둘중 하나만 해도 됨
			StudentList.add(new Student(name, ka, number, score));
		}
		for (Student student : StudentList) {
			System.out.println("----------------------");
			System.out.println("이름 :" + student.getName());
			System.out.println("이름 :" + student.getKa());
			System.out.println("이름 :" + student.getNumber());
			System.out.println("이름 :" + student.getScore());
		}
//		String name = "";
//		while(name.equals("그만")){ 이렇게 해도 됨
		while (true) {
			System.out.print("학생 이름>>");
			String name = sc.next();
			if (name.equals("그만")) {
				break;
			}
			boolean flag = false;
			for (Student student : StudentList) {
				if (name.equals(student.getName())) {
					System.out.println(student.getName() + "," + student.getKa() + "," + student.getNumber() + ","
							+ student.getScore());
					flag = true;
				}
			}
			if (flag == false) {
				System.out.println("해당 학생이 없습니다.");
			}
		}
		System.out.println("프로그램이 종료됩니다.");

		Map<String, Student> studentMap = new HashMap<>();
		for (int i = 0; i < 5; i++) {
			System.out.print(">>");
			String name = sc.next();
			String ka = sc.next();
			int number = sc.nextInt();
			double score = sc.nextDouble();
			Student s = new Student(name, ka, number, score);
			studentMap.put(name, s);
		}
//			전체 인원 출력 코드
		for (String name : studentMap.keySet()) {
			System.out.println("----------------------");
			System.out.println("이름 :" + studentMap.get(name).getName());
			System.out.println("이름 :" + studentMap.get(name).getKa());
			System.out.println("이름 :" + studentMap.get(name).getNumber());
			System.out.println("이름 :" + studentMap.get(name).getScore());
		}
		while (true) {
			System.out.print("학생 이름>>");
			String name = sc.next();
			if (name.equals("그만")) {
				break;
			}
			if (studentMap.containsKey(name)) {
				System.out.println(studentMap.get(name).getName() + "," + studentMap.get(name).getKa() + ","
						+ studentMap.get(name).getNumber() + "," + studentMap.get(name).getScore());
			} else {
				System.out.println("해당하는 학생이 없습니다.");
			}
		}

	}
}