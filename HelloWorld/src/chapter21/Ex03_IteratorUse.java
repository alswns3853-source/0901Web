package chapter21;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class Ex03_IteratorUse {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		List<String> list = new LinkedList<>();
		list.add("Orange");
		list.add("apple");
		list.add("apple");
		list.add("banana");
//		향상된 for문
//		for(자료형 변수이름 : 리스트)
		for (String s : list) {
			System.out.print(s + '\t');
		}
		System.out.println();
// 		반복자(Interator) 생성하기
		Iterator<String> itr = list.iterator();
		String str;
//		hasNext() : 다음데이터가 있으면 true, 없으면 false
		while (itr.hasNext()) {
//			next() : 다음데이터를 출력
			str = itr.next();// 0:Orange, 1:apple, 2:apple, 3:banana
			System.out.print(str + '\t');
			if (str.equals("Orange")) {
//				remove(): 사용된 Orange를 삭제하는 메서드
//				next()메서드가 실행되면 다음 데이터가 나오기 때문에 거의 사용되지 않음
				itr.remove();
			}
		}
		System.out.println();

		itr = list.iterator();
		while (itr.hasNext()) {
			System.out.print(itr.next() + '\t');
		}
		System.out.println();
	}
}