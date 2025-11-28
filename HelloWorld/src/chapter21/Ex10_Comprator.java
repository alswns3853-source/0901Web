package chapter21;

import java.util.Comparator;
import java.util.Set;
import java.util.TreeSet;

class MyStringComparator implements Comparator<String>{

	@Override
	public int compare(String o1, String o2) {
//		return o1.length() - o2.length(); // 글자수 오름차순
//		return o2.length() - o1.length(); // 글자수 내림차순
//		return o1.compareTo(o2); // 글자 사전순 오름차순
		return o2.compareTo(o1); // 글자 사전순 내림차순
	}
	
}

public class Ex10_Comprator {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		Comparator 인터페이스
//		Comparable을 사용할 수 없는 경우나 이미 설정한 경우 다른 정렬기준을 설정할때 사용하는 인터페이스
//		Set<String> tree = new TreeSet<>(new MyStringComparator());
		Set<String> tree = new TreeSet<>(new Comparator<String>() {
			@Override
			public int compare(String o1, String o2) {
				return o2.compareTo(o1);
			}
		});
		tree.add("홍길동");
		tree.add("전우치");
		tree.add("전우치");
		tree.add("멀린");
		tree.add("해리포터");
		for(String s : tree) {
			System.out.println(s);
		}
		System.out.println();
	}

}
