package chapter5;

import java.util.Scanner;

public class Ex02_Sacnner {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 콘솔창에서 입력한 내용을 받기 위한 준비
          Scanner sc = new Scanner(System.in);
          
      	System.out.println("inputB에 저장할 값을 입력해주세요.");      	
        byte inputByte = sc.nextByte();
        System.out.println("inputB의 값 : "+inputByte);
        System.out.println("inputShort에 저장할 값을 입력해주세요.");
        short inputShort = sc.nextShort();
        System.out.println("inputShort의 값 : "+inputShort);
        System.out.println("inputLong에 저장할 값을 입력해주세요.");
        long inputLong = sc.nextLong();
        System.out.println("inputLong의 값 : "+inputLong);
                        
         System.out.println("첫번째 숫자를 입력하세요.");
        // sc.nextInt : 콘솔창에 문자데이터를 받아와 int 자료형 변수 저장
       int num1 = sc.nextInt();
    System.out.println("두번째 숫자를 입력하세요.");
    int num2 = sc.nextInt();
        int sum= num1 + num2; 
       System.out.println(num1+"과 "+num2+"의 합은 "+sum+" 입니다.");
      
		
	}

}
