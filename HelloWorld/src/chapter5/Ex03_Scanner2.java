package chapter5;

import java.util.Scanner;

public class Ex03_Scanner2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// ctrl + shift + o : 자동 임포트 단축키
        Scanner sc = new Scanner(System.in);
        System.out.println("줄(엔터) 단위로 입력하기");
        String name1 = sc.nextLine();
        System.out.println(name1);
        
        System.out.println("뛰어쓰기 단위로 입력하기");
        String name2 = sc.next();
        String name3 = sc.next();
        String name4 = sc.next();
        System.out.println(name2+","+name3+","+name4);
        
        
        
	}

}
