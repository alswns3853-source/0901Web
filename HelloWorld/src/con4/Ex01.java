package con4;

import java.util.Scanner;

public class Ex01 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        Scanner sc = new Scanner(System.in);
        System.out.print("알파벳 한 문자를 입력하세요>>");
        String s = sc.next(); // 문자열로 읽음
        char c = s.charAt(0); // 문자열의 첫 번째 문자
        // 소문자 a는 숫자 97로 저장됨, 숫자이기 때문에 반복의 변수로 사용 가능
        for(char i='a'; i<=c; i++) {
        	for(char j= i; j<=c; j++) {
        	System.out.print(j);
        }
        System.out.println();
	    }
        // c = e = 101
        // 반복문으로
        // 97~101까지
        // 97~100
        // 97~99
        // 97~98
        // 97
        		
	}
	} 


