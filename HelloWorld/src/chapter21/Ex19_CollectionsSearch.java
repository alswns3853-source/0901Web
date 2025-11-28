package chapter21;

import java.util.ArrayList; 
import java.util.Collections;
import java.util.List;

public class Ex19_CollectionsSearch {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		List<String> list = new ArrayList();
		list.add("전우치");
		list.add("홍길동");
		list.add("멀린");
		list.add("손오공");
		
//		binarySearch를 실행하기 전 반드시 실행하는 정렬 처리
		Collections.sort(list);
		System.out.println(list);
//		binarySearch(리스트, 찾을데이터) : 리스트에서 데이터가 위치하는 인덱스 값을 출력
		int idx1 = Collections.binarySearch(list, "홍길동");
		System.out.println(idx1);
		
		int idx2 = Collections.binarySearch(list, "멀린");
		System.out.println(idx2);
		
//		없는 데이터를 검색하는 경우 마이너스 값을 출력
		int idx3 = Collections.binarySearch(list, "해리포터");
		System.out.println(idx3);
		
//		contains(찾을데이터) : list안에 데이터가 있으면 true, 없으면 false를 반환
		System.out.println(list.contains("전우치"));
		System.out.println(list.contains("테스트"));
	}

}
