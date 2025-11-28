package chapter2;

public class Ex02_CharAndString {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// char 자료형 : 한글자만 저장할 수 있는 자료형
		// 반드시 '(작은 따움표)로 감싸서 값을 저장
		// 한글자 한글자씩 확인해야하는 경우
		char c = 'A'; // 문자로 저장
	    char numChar = 5000; // 숫자로 저장
	    System.out.println(c);
	    System.out.println(numChar);
	    // String 자료형: 여러 문자를 저장하는 자료형
	    // 반드시 "(큰따움표)로 감싸서 사용
	    // String 은 클래스 자료형으로 여러가지 기능을 사용할 수 있음
	    String str = "안녕하세요";
	    char resultCharAt = str.charAt(3);
	    System.out.println(resultCharAt);
	    
	  
	}
}
