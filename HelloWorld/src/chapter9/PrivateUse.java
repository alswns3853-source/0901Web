package chapter9;


class Student1{
// 접근제한자를 생략하는 경우 : 같은 패캐지와 클래스는 데이터를 변경하거나 사용할 수 있음
	String name;
	int age;
}
class Student2{
// public: 변수를 다른 패키지, 다른 클래스에서 사용 가능하도록 만드는 접근제한자 
	public String name;
// private: 현재 클래스에서만 자유롭게 사용할 수 있도록 만드는 접근제한자
	private int age;
	public Student2(String name, int age) {
		this.name = name;
		this.age = age;
	}
//	getter : 데이터를 출력하기 위한 메서드, 원하는 형식으로 바꾸거나 하는것도 가능
	public int getAge() {
		return age;
	}
	// setter : 부적절한 데이터가 저장되지 않도록 하는 메서드(db의 제약조건과 비슷)
	public void setAge(int age) {
//		age가 0보다 작거나 150보다 크다면 나이가 부적절하다고 출력하고
//		나이를 0으로 바꾸는 코드를 실행
		if(age<0 || age>150) {
			System.out.println("나이가 부적절합니다.");
			this.age = 0;
			return;
		}
//		age가 0~150 사이라면 그대로 저장
		this.age = age;
	}
	
}

public class PrivateUse {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        Student1 student1 = new Student1();
//        접근제한자 생략으로 데이터 변경 가능
        student1.name = "홍길동";
        student1.age = -20;
//        접근제한자 생략으로 데이터 사용 가능
        System.out.println(student1.name+" 의 나이는 "
                     +student1.age+"살 입니다.");
        
        Student2 student2 = new Student2("전우치", 20);
        student2.name = "손오공 ";
//      age는 private으로 설정했기 때문에 사용할 수 없음, 에러 발생
//        student2.age = -10;
        student2.setAge(-10);
        int age = student2.getAge();
        System.out.println(student2.name+" 의 나이는 "
                     +age+"살 입니다.");
        
        Emp emp= new Emp();
        emp.setSal(2112111.12);
        System.out.println(emp.getSal());
	}

}
