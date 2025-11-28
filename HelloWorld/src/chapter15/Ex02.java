package chapter15;

import java.util.Scanner;

public class Ex02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[] intArr = new int[5];
        Scanner sc = new Scanner(System.in);
        System.out.println("숫자 5개를 입력해주세요>>");
//        intArr[0]= sc.nextInt();
//        intArr[1]= sc.nextInt();
//        intArr[2]= sc.nextInt();
//        intArr[3]= sc.nextInt();
//        intArr[4]= sc.nextInt();
        for(int i=0; i<intArr.length; i++) {
        	intArr[i] = sc.nextInt();
        }
        for(int i : intArr) {
        	System.out.println(i);
        }
	}
	
}
