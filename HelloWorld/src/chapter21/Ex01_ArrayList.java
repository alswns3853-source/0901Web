package chapter21;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class Ex01_ArrayList {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		String데이터를 5개 저장할 수 있는 배열 선언
		String[] strArr = new String[5];
//		List의 특징
//		1. 데이터를 저장하는 개수의 제한이 없음
//		2. 배열처럼 데이터를 저장하는 순서를 가지고 있어 인덱스를 이용하여 출력할 수 있음
//		3. 같은 데이터를 넣어도 저장 가능함, 중복 허용
//		List<자료형> 변수이름 = new ArrayList<>();
		List<String> list = new ArrayList<>();
//		List<String> list = new LinkedList<>();
//		add(제네릭에 설정한 자료형에 맞는 데이터) : list에 데이터를 저장하는 메서드
		list.add("Orange"); // 0번째 데이터
		list.add("apple"); // 1번째 데이터
		list.add("apple"); // 2번째 데이터
		list.add("banana"); // 3번째 데이터
		list.add("Melon"); // 4번째 데이터

//		list도 배열처럼 0번부터 저장한다. 출력할때도 0번부터 사용함
		for(int i=0; i<list.size(); i++) {
//			size() : 리스트에 저장되어있는 개수를 출력하는 메서드
//			get(인덱스) : 인덱스에 해당하는 데이터를 출력하는 메서드
			System.out.print(list.get(i)+'\t');
		}
		System.out.println();
//		remove(인덱스) : 인덱스에 해당하는 데이터를 삭제하는 메서드
//		뒤에 있던 데이터는 인덱스가 앞으로 당겨지게 됨
		list.remove(0);

//		배열처럼 향상된 for문도 사용 가능
//		for(제네릭에 설정한 자료형 변수이름 : 리스트이름){
		for (String str : list) {
			System.out.print(str + "\t");
		}
		System.out.println();
	}
	
}