package chapter14;

import java.util.Arrays;
import java.util.StringTokenizer;

public class Ex01_StringUse {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String str1 = new String("자바프로그래밍");
		String str2 = new String("자바프로그래밍");
		String str3 = "자바프로그래밍";
		String str4 = "자바프로그래밍";
		
		// == : 객체를 비교할 경우 메모리주소를 확인하는 연산자
		if(str1 == str2) {
			System.out.println("str1과 str2는 동일한 객체 참조");
		}else {
			System.out.println("str1과 str2는 다른 객체 참조");
		}
		if(str3 == str4) {
			System.out.println("str3과 str4는 동일한 객체 참조");
		}else {
			System.out.println("str3과 str4는 다른 객체 참조");
		}
//		equals() : String안의 문자열을 비교하는 메서드
		if(str1.equals(str2)) {
			System.out.println("str1과 str2는 동일한 문자열");
		}else {
			System.out.println("str1과 str2는 다른 문자열");
		}
		if(str3.equals(str4)) {
			System.out.println("str3과 str4는 동일한 문자열");
		}else {
			System.out.println("str3과 str4는 다른 문자열");
		}
		
//		대소문자를 구분하지 않고 문자열을 비교하는 메서드
		String str5 = "Apple";
		String str6 = "apple";
		if(str5.equals(str6)) {
			System.out.println("equals:str5와 str6은 동일한 문자열");
		}
		if(str5.equalsIgnoreCase(str6)) {
			System.out.println("equalsIgnoreCase:str5와 str6은 동일한 문자열");
		}
//		compareTo() : 사전순으로 비교하여 앞에 있으면 음수, 뒤에 있으면 양수, 같으면 0
		System.out.println(str5.compareTo(str6));
//		compareToIgnoreCase() : compareTo()와 같지만 대소문자를 구분하지 않음
		System.out.println(str5.compareToIgnoreCase(str6));
		
//		문자열 합치기
		System.out.println(str5.concat(str6));
		System.out.println(str5 + str6);
		
//		문자열에서 문자 찾기
		String str= "AppleBananaOrange";
		System.out.println(str.indexOf("aO"));
		System.out.println(str.indexOf("B"));
//		문자열 자르기
		System.out.println(str.substring(5)); // 5번 위치부터 끝까지
		System.out.println(str.substring(5,10+1));// 5번 위치부터 10번위치까지
		System.out.println(str.substring(str.indexOf("Banana"), str.indexOf("Orange")));

		
//      아래의 전화번호를 각각 출력해보자
		String tel ="051-781-1234";
		System.out.println(tel.substring(0,2+1));
		System.out.println(tel.substring(4,6+1));
		System.out.println(tel.substring(8));
//		251016 : 연월일을 각각 출력해보자
		String num = "251016";
		System.out.println(num.substring(0,1+1));
		System.out.println(num.substring(2,3+1));
		System.out.println(num.substring(4));
		
//		문자열 길이 구하기 메서드
		String str7 = "123456789";
		System.out.println(str7.length());
		
//		해당 위치에 있는 문자를 돌려주는 메서드
		String str8 = "Orange";
		System.out.println(str8.charAt(0));
		System.out.println(str8.charAt(1));
		System.out.println(str8.charAt(2));
		
//		기본자료형을 문자열자료형으로 변경하는 메서드
		int a = 1;
		double b = 3.14;
		boolean c = true;
		String aStr = String.valueOf(a);
		String bStr = String.valueOf(b);
		String cStr = String.valueOf(c);
//		replace("바뀌기전문자열","바꾼후문자열"): 특정 문자열 변경하기
		str = "AppleBananaOrange";
		System.out.println(str);
		str = str.replace("Orange", "Melon");
		System.out.println(str);
//		특정 문자를 기준으로 나누는 메서드
		str = "010-1234-5678";
		String[] strArr = str.split("-");
		System.out.println(Arrays.toString(strArr));
		str = "홍길동,이순신,강간찬";
		strArr = str.split(",");
		System.out.println(Arrays.toString(strArr));
//		StringTokenizer : 특정 문자를 기준으로 나누는 클래스
		StringTokenizer st1 = new StringTokenizer("a b c");
//		hasMoreTokens() : 다음 데이터가 있으면 true 없으면 false를 반환
 		while(st1.hasMoreTokens()) {
// 			nextToken() : 다음 데이터를 반환
			System.out.println(st1.nextToken());
		}
		StringTokenizer st2 = new StringTokenizer("1 2 3",",");
		while(st2.hasMoreTokens()) {
			System.out.println(st2.nextToken());
		}
	}

}
