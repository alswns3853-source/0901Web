package chapter6;

import java.util.Scanner;

import javax.rmi.ssl.SslRMIClientSocketFactory;

public class Ex03_stritest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        Scanner sc = new Scanner(System.in);
        System.out.println("두 정수를 입력하세요>>");
        int num1 = sc.nextInt(); 
        int num2 = sc.nextInt();
        System.out.println(num1+"+"+num2+"은 "+(num1+num2));
        
        System.out.println("몇 층인지 입력하세요>>");
        int s = sc.nextInt();
        int he = 5;
        System.out.println(he*s+"m입니다.");
        
        System.out.println("x 값을 입력하세요>>");
        int x = sc.nextInt();
        int y = x * x - 3 * x + 7;
        System.out.println("x="+x+", y="+y);  
        
        System.out.println("커피 주문하세요>>");
        String coffee= sc.next(); // 커피의 종류
        int comm = sc.nextInt(); // 몇잔인지 저장
        if(coffee.equals("에스프레소")){
        	System.out.print(comm*2000+"원입니다.");
        }
        else if(coffee.equals("카푸치노")) {
        	System.out.println(comm*3000+"원입니다.");
        }
        else if(coffee.equals("아메리카노")) {
        	System.out.println(comm*2500+"원입니다.");
        }
        else if(coffee.equals("카페라떼")) {
        	System.out.println(comm*3500+"웝입니다.");
        }
        
     
        	
        }
     
     
	} 


