package Test1;

import java.util.Scanner;

class Phone {
	private String name;
	private String tel;
	private String address;
	
	public Phone(String name, String tel, String address) {
		this.name = name;
		this.tel = tel;
		this.address = address;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
}

public class Q2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//	[문제2] 작성할 클래스명: Phone 클래스, PhoneManager 클래스
//	이름(name)과 전화번호(tel) 필드, 주소(address), 
//	생성자 및 필요한 메소드를 가진 Phone 클래스를 작성하고, 
//	다음 실행 사례와 같이 작동하도록 main()을 가진 PhoneManager 클래스를 작성하세요. 
//	한 사람의 전화번호는 하나의 Phone 객체로 다룹니다.

//	인원수 >> 3
//	이름과 전화번호(번호는 연속적으로 입력), 주소 >> 김인수 111-1111 서울
//	이름과 전화번호(번호는 연속적으로 입력), 주소 >> 조수미 222-2222 부산
//	이름과 전화번호(번호는 연속적으로 입력), 주소 >> 한원선 333-3333 경기도
//	저장되었습니다...

//	검색할 이름 >> 한원선
//	한원선의 번호와 주소는 333-3333, 경기도 입니다.
//	검색할 이름 >> 박인수
//	박인수 은(는) 없습니다.
//	검색할 이름 >> exit
//	프로그램을 종료합니다...
		Scanner sc = new Scanner(System.in);
		Phone phone [];
		int i;
		System.out.print("인원수 >>");
		int n = sc.nextInt();
		phone = new Phone[n];
		
		for (i=0; i<phone.length; i++) {
			System.out.print("이름과 전화번호(번호는 연속적으로 입력), 주소 >>");
			String name = sc.next();
			String tel = sc.next();
			String  address = sc.next();
			phone[i] = new Phone(name, tel, address);
		}
		System.out.println("저장되었습니다...");
		
		while(true) {
			System.out.println();
			System.out.print("검색할 이름 >>");
			String name =sc.next();
			
			for(i=0; i<phone.length; i++) {
				if(name.equals(phone[i].getName())) {
					System.out.print(name+"의 번호와 주소는 "  + phone[i].getTel() + ", " 
	                           + phone[i].getAddress() +" 입니다.");
			        break;
				}
			}
			if(name.equals("exit")) {
				System.out.print("프로그램을 종료합니다...");
				break;
			}
			if ( i == phone.length) {
				System.out.print(name+" 은(는)없습니다.");
			}
		}
	}

}
