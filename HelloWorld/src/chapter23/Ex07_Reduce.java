package chapter23;

import java.util.Arrays;
import java.util.List;

public class Ex07_Reduce {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		List<String> list1 = Arrays.asList("홍길동", "전우치", "손오공");
		String name1 = list1.stream()
//						초기값 , (매개변수1,매개변수2)
//				-> 실행할 코드
//			첫번째 실행 : s1=이순신, s2=홍길동 3>=3 ? 이순신:홍길동 결과:이순신
//		    두번째 실행 : s1=이순신, s2=전우치 3>=3 ? 이순신:전우치 결과:이순신
//			세번째 실행 : s1=이순신, s2=손오공 3>=3 ? 이순신:손오공 결과:이순신
				.reduce("이순신", (s1,s2) -> 
					s1.length() >= s2.length() ? s1 : s2);
		System.out.println(name1);
		
		List<String> list2 = Arrays.asList("홍길동", "멀린", "해리포터");
//			첫번째 실행 : s1=이순신, s2=홍길동 3>=3 ? 이순신:홍길동 결과:이순신
//	   	 	두번째 실행 : s1=이순신, s2=멀린 3>=2 ? 이순신:멀린 결과:이순신
//			세번째 실행 : s1=이순신, s2=해리포터 3>=4 ? 이순신:해리포터 결과:해리포터
		String name2 = list2.stream()
				.reduce("이순신", (s1,s2) -> 
					s1.length() >= s2.length() ? s1 : s2);
		System.out.println(name2);
	}

}
