package chapter21;

import java.util.Iterator;
import java.util.LinkedList;

public class Ex05_PrimitiveData {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		LinkedList<Integer> list = new LinkedList<>();
//		오토박싱 : int자료형을 Integer자료형으로 자동으로 변환하여 저장
		list.add(10);
		list.add(20);
		list.add(30);
		for(Iterator<Integer> itr= list.iterator(); itr.hasNext(); ) {
//			오토 언박싱 : Integer자료형으로 int자료형으로 자동으로 변환하여 저장
			int n =itr.next();
			System.out.println(n);
		}
	}

}
