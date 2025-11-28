package chapter21;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class Ex17_CollectionsSort {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		List<String> list = new ArrayList();
		list.add("전우치");
		list.add("홍길동");
		list.add("멀린");
		list.add("손오공");
		
		System.out.println(list);
		
		Collections.sort(list); // 오름차순 정렬
		
		System.out.println(list);
		
//		내림차순 정렬	
//		Collections.sort(list, new Comparator<String>() {
//			@Override
//			public int compare(String o1, String o2) {
//				return o2.compareTo(o1);
//			}
//		});
//		내림차순 정렬
		Collections.sort(list, Collections.reverseOrder());
				
		System.out.println(list);
	}

}
