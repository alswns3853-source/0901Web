package chapter21;

import java.util.Collections;
import java.util.Vector;

public class Ex20_CollectionsCopy {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// Vector 자료구조
//		ArrayList와 사용방법은 완전히 동일함
//		Vector경우 스레드 사용시 안전하게 사용할 수 있음
		Vector<String> list = new Vector<>();
		list.add("홍길동");
		list.add("멀린");
		list.add("해리포터");
		list.add("전우치");
		System.out.println(list);
		System.out.println("객체 수:"+list.size());
		System.out.println("3번째 데이터:"+list.get(2));
		list.remove(0);
		System.out.println(list);
		Collections.sort(list);
		System.out.println(list);
	}

}
