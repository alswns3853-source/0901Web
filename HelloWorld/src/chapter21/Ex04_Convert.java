package chapter21;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class Ex04_Convert {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String[] strArr = {"홍길동","전우치","손오공","전우치"};
//		배열처럼 선언과 동시에 데이터를 저장하고 싶을때 사용하는 방식
		List<String> list = Arrays.asList("홍길동","전우치","손오공","전우치");
//		Arrays.asList()로 생성한 리스트의 경우 추가, 변경, 삭제가 불가능함
//		list.add("멀린"); 에러 발생
//		수정 가능한 list로 변경
		list = new ArrayList<>(list);
		list.add("해리포터");
//		for(초기값으로 Iterator생성; 조건식을 hastNext(); 증감식생략)
//		권장되지 않은 방식, while을 사용하는 방식 권장됨
		for(Iterator<String> itr = list.iterator(); itr.hasNext(); ) {
			System.out.print(itr.next()+'\t');
		}
		System.out.println();
//		링크드 리스트도 같은 방식으로 변경 가능
		list = new LinkedList<>(list);
//		향상된 for문을 통한 반복 : 단순 반복에서 사용
		for(String s : list) {
			System.out.print(s + '\t');
		}
		System.out.println();
	}

}
