package chapter6;

import java.util.Scanner;

public class ex08 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        Scanner sc = new Scanner(System.in);
        System.out.println("커피를 주문하세요>>");
            String coffee = sc.next();
            int comm = sc.nextInt();
            switch(coffee) {
            case "에스프레소":
            	System.out.println(comm*2000+"원입니다.");
            	break;
            case "카푸치노":
            System.out.println(comm*3000+"원입니다.");
            break;
            case "아메리카노":
            	System.out.println(comm*2500+"원입니다.");
            	break;
            case "카페라떼":
            	System.out.println(comm*3500+"원입니다.");
            }
	}

}
