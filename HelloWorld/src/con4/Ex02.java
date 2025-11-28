package con4;

import java.util.Scanner;

public class Ex02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[] intArr = new int[10];
//		int배열에 10개의 데이터를 저장하는 반복문
		Scanner sc = new Scanner(System.in);
		System.out.print("정수 10개 입력>>"+" ");
//		int배열을 생성
		for(int i=0; i<intArr.length; i++) {
        	intArr[i] = sc.nextInt();
        }
//		배열의 데이터 중에 3의 배수만 출력하는 반복문
        for(int num:intArr) {
    		if(num %3 == 0) {
    			System.out.print(num + " ");
    		}
    			
	}
}
}
  
