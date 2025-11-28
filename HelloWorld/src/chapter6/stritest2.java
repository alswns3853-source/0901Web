package chapter6;

import java.util.Scanner;

public class stritest2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		  Scanner scanner = new Scanner(System.in);
	        System.out.print("논리 연산을 입력하세요");
	        boolean a = scanner.nextBoolean();
	        String op = scanner.next();
	        boolean b = scanner.nextBoolean();
	        switch(op) {
	        case "AND": case "and" : case "&&" : case "&" :
	        	System.out.println(a && b);
	        	break;
	        case "OR": case "or" : case "||" : case "|" :
	            System.out.println(a || b);
	            break;
	        }
	}

}
