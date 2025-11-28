package chapter6;

import java.util.Scanner;

public class doyouknowtrickcal {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        Scanner sc = new Scanner(System.in);
        System.out.println("학점을 입력하세요>>");
        String abcd= sc.next(); 
        switch(abcd){
        case "A": case "B":
        System.out.println("Excellent");
        break;
        case "C": case "D":
        	System.out.println("Good");
        	break;
        case "F":
        	System.out.println("Bye");   
        	break;
        	default:
        		System.out.println("A,B,C,D,F 중에 입력하세요.");
        }
	}

}
