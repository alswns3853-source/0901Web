package chapter23;

import java.util.Arrays;
import java.util.List;

public class Ex05_Map {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		List<String> list = Arrays.asList("apple", "banana", "orange");
		list.stream()
//			map(람다식) : 람다식을 실행하여 결과물을 변환
			.map(s -> s.toUpperCase())
			.forEach(n->System.out.print(n+"\t"));
		
		System.out.println();
		List<String> list2 = Arrays.asList("ApPlE", "BaNaNa", "OrAnGe");
		list.stream()
			.map(s -> s.toLowerCase())
			.forEach(n->System.out.print(n+"\t"));
		
		System.out.println();
		list.stream()
			.map(s -> s.length())
			.forEach(n->System.out.print(n+"\t"));
		
		System.out.println();
		list.stream()
		.map(s -> s + "입니다.")
		.forEach(n-> System.out.print(n+"\t"));
		
	}

}
