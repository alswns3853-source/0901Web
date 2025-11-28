package con5;

import java.util.Scanner;

class Phone {
	// 같은 자료형이면 ,를 이용하여 동시에 선언할 수 있음
	private String name, tel;
    // 생성자 : name, tel변수를 반드시 설정하도록 작성
	public Phone(String name, String tel) {
		this.name = name;
		this.tel = tel;
	}
    // 멤버 변수가 private일 경우 사용하는 getter
	public String getName() {
		return name;
	}
    
	public String getTel() {
		return tel;
	}
}
public class Ex2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        Scanner sc = new Scanner(System.in);
        Phone[] phones = new Phone[2];
        // 이름과 전화번호를 입력 받아 phone객체를 생성하여 배열에 저장하는 반복문
        for(int i=0; i<phones.length; i++) {
        	System.out.print("이름과 전화번호 입력 >>");
        	//이름을 입력 받는 코드
        	String name = sc.next();
        	//전화번호를 입력받는 코드
        	String tel = sc.next();
        	//Phone객체를 생성하여 phoneArr배열에 저장하는 코드
        	phones[i] = new Phone(name, tel);
        	
        }
        for(Phone i: phones) {
        	System.out.println(i.getName()+"의 번호 "+i.getTel());
        }
	}
}
