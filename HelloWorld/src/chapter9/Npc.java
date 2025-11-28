package chapter9;

public class Npc {
//	맴버변수, 필드 : 클래스 바로 아래에 적는 변수
    String name;
    int hp;
    String adress;
    String phone;
    int age;
    
    private String privateData;
    
 // 기본 생성자, default 생성자
	Npc(){}
// 직접 작성한 생성자: 맴버 변수에 인스턴스 생성시 값을 설정하는 용도
//	1. 생성자를 하나도 만들지 않으면 기본 생성자가 만들어짐
//	2. 생성자를 직접 만들면 기본 생성자는 만들어지지 않고 기본생성자도 사용하고
//	   싶다면 직접 만들어서 사용해야함.
//	3. 생성자도 메서드처럼 오버로딩이 가능하여 매개변수의 개수나 자료형을 다르게 하여
//	   필요한 만큼 작성할 수 있음.	   
 	Npc(String name, int hp){
 		// this : 인스턴스(객체) 자신을 의미한다
 		// 멤버변수name = 매개변수name
 		this.name = name;
 	    // 멤버변수hp = 매개변수hp
 		this.hp = hp;
 		privateData = "홍길동";
 	}
// 생성자 자동 완성하기
// 	1. source 탭 열기
// 	2. Generate Constructor using fields 화면 열기
// 	3. 생성자에 추가하고 싶은 맴버변수 설정하기
// 	4. Generate 버튼을 눌러 생성자 자동 생성하기
 	public Npc(String name, int hp, String adress, String phone) {
 		this.name = name;
 		this.hp = hp;
 		this.adress = adress;
 		this.phone = phone;
 	}

//  자기소개를 출력하는 메서드 
    void say(String a) {
    	System.out.println(name);
    	System.out.println("안녕하세요. 저는 "+name+" 입니다.");
    }
    public Npc(String name, int hp, String adress, String phone, int age) {
	super();
	this.name = name;
	this.hp = hp;
	this.adress = adress; 
	this.phone = phone;
	this.age = age;
}
	// hp 맴버 변수의 데이터를 변경하는 메서드
    void setHp(int hpData) {
    	hp = hpData; 
    }
}