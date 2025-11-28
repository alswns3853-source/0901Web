package con8;

import java.util.HashMap;
import java.util.Scanner;
import java.util.Vector;

public class q1 {

//	1. 학점(‘A’, ‘B’, ‘C’, ‘D’, ‘F’)을 컬렉션에 저장하라. 그러고 나서 컬렉션을 검색하여 학점을 점수
//	(A=4.0, B=3.0, C=2.0, D=1.0, F=0.0)로 변환하여 출력하는 프로그램을 작성하라.
//	1) Vector 컬렉션을 이용
	// TODO Auto-generated method stub

	public static void main(String[] args) {
//		1) Vector 컬렉션을 이용	
		Scanner sc = new Scanner(System.in);
		Vector<String> list = new Vector<>();
		list.add("A");
		list.add("B");
		list.add("C");
		list.add("D");
		list.add("F");

		for (String score : list) {
			if (score.equals("A")) {
				System.out.println("A=4.0");
			} else if (score.equals("B")) {
				System.out.println("B=3.0");
			} else if (score.equals("C")) {
				System.out.println("A=2.0");
			} else if (score.equals("D")) {
				System.out.println("D=1.0");
			} else if (score.equals("F")) {
				System.out.println("F=0.0");
			}
		}
		System.out.println();
//		2) HashMap 컬렉션을 이용
		HashMap<String, String> map = new HashMap<>();
		map.put("A", "4.0");
		map.put("B", "3.0");
		map.put("C", "2.0");
		map.put("D", "1.0");
		map.put("F", "0.0");

		System.out.println("A=" + map.get("A"));
		System.out.println("B=" + map.get("B"));
		System.out.println("C=" + map.get("C"));
		System.out.println("D=" + map.get("D"));
		System.out.println("F=" + map.get("F"));

	}

}
