package chapter21;

import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

public class Ex15_HashMapKeySet {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		HashMap<String, Integer> map = new HashMap<>();
		Map<String, Integer> map = new TreeMap<>();
		map.put("홍길동", 20);
		map.put("전우치", 25); 
		map.put("손오공", 27);
//		keySet() : 모든 key값을 Set자료구조에 출력하는 메서드
		Set<String> ks = map.keySet();
//		모든 key를 출력하는 반복문
		for(String s : ks) {
			System.out.print(s+'\t');
		}
		System.out.println();
//		모든 value를 출력하는 반복문
		for(String s : ks) {
//			get() 메서드에 key를 설정하여 출력하는 부분
			System.out.print(map.get(s).toString() + '\t');
		}
		System.out.println();
//		반복자를 사용하여 모든 value를 출력하는 반복문
		Iterator<String> itr = ks.iterator();
		while(itr.hasNext()) {
			System.out.print(map.get(itr.next()).toString()+'\t');
		}
		System.out.println();
		
	}

}
