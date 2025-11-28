package chapter23;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

public class WEx03_CollectionVsStream {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		Arrays.asList() : 데이터를 변경할 수 없는 리스트 생성
		List<Integer> list = Arrays.asList(1,3,5,2,4);
//		변경할 수 있는 리스트로 변환
		list = new ArrayList<>(list);
		List<Integer> list2 = new ArrayList<>();
//		홀수만 출력하는 로직
		for(int i =0; i<list.size(); i++) {
			if(list.get(i)%2 == 1) {
				list2.add(list.get(i));
			}
		}
//		오름차순 정렬
		Collections.sort(list2);
		System.out.println(list2);
		
		list = new ArrayList<>(list);
//		정렬 후  list의 내용이 변경되지 않아 따로 저장이 필요함
		list = list.stream()
				.filter(n -> n%2==1)
				.sorted()
				.collect(Collectors.toList());
		System.out.println(list);
	}

}
