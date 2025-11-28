package chapter8;

import java.util.Scanner;

public class MyCalculcator {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        Scanner sc = new Scanner(System.in);
        while(true) {
        	 showMenu();
//        	 콘솔창에서 입력한 문자열의 첫글자만 myChar변수에 저장
        	 char myChar = sc.nextLine().charAt(0);
//        	 myChar가 0~9사이가 아닌 경우 continue를 실행
        	 if(!checkNum(myChar)) {
        		 System.out.println("메뉴를 잘못 선택했습니다.");
        		 continue;
        	 }
        	 // 0~9사이인 경우 char자료형을 int자료형 변환
//        	 문자데이터 : '8' - '0'
//        	 아스키코드 : 56 - 48 = 1
//        	 int로 저장하면 숫자가 저장됨
        	 int num = myChar - '0';     	
        	 if(num==0) { 
        		 break; 
        	 }else {
        		 if(num>4) {
        			 System.out.println("메뉴를 잘못 선택했습니다.");
        			 continue;
        		 }
        		 System.out.print("첫 번째 숫자:");
        		 int num1 = sc.nextInt();
        		 System.out.print("두 번째 숫자:");
        		 int num2 = sc.nextInt();
//        		 next, nextInt 같은 뛰어쓰기로 데이터를 받는 메서드를 사용한 후
//        		 nextLine을 한번 실해하여 오류가 나지 않도록 설정
        		 sc.nextLine();
        		 
        		 if(num==1) {
        			 addNum(num1,num2);
        		 }else if(num==2) {
        				 minusNum(num1,num2);
        			 }else if(num==3) {
        				 multiplyNum(num1, num2);
        			 }else if(num==4) {
        				 divideNum(num1,num2);
        			 }
        		 }
        	 }
        System.out.println("계산기를 종료합니다.");
	}
    // 계산기 메뉴를 출력하는 메서드
    public static void showMenu() {
	 System.out.println("메뉴틀 선택해주세요.");
	 System.out.println("1.더하기");
	 System.out.println("2.빼기");
	 System.out.println("3.곱하기");
	 System.out.println("4.나누기");
	 System.out.println("0.끝내기"); 	
}
    public static void addNum(int num1, int num2) {
    	int result = num1 + num2;
    	System.out.println(num1+"+"+num2+"="+result);
    }
    public static void minusNum(int num1, int num2) {
    	int result = num1 - num2;
    	System.out.println(num1+"-"+num2+"="+result);
    }
    public static void multiplyNum(int num1, int num2) {
    	int result = num1 * num2;
    	System.out.println(num1+"*"+num2+"="+result);
    }
    public static void divideNum(int num1, int num2) {
    	int result = num1 / num2;
    	System.out.println(num1+"/"+num2+"="+result);
    	int result2 = num1 % num2;
    	System.out.println(num1+"%"+num2+"="+result2);  
    }
    public static boolean checkNum(char ch) {
//    	매개변수 ch가 0~9 사이의 글자인지 확인하는 if문
    	if(ch >= '0' && ch<='9') {
    		// 0~9 사이라면 true 반환
    		return true;
    	}else {
    		// 0~9 사이가 아니라면 false를 반환
    		return false;
    	}
    }
}