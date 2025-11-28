package chapter21;

import java.util.HashMap;

public class Ex14_HashMap {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		HashMap<key, value> 변수이름 = new HashMap<>();
//		key : 중복되지 않는 데이터, Comparable을 상속받은 클래스만 사용 가능
//		value : 자유롭게 저장하고 싶은 데이터를 설정
		HashMap<String, String> map = new HashMap<>();
//		put(key, value) : Map에 데이터를 저장하는 메서드
		map.put("홍길동", "010-1234-1443");
		map.put("전우치", "010-4321-1446");
		map.put("손오공", "010-9876-1443");
//		get(key) : key에 일치하는 value값을 출력하는 메서드
		System.out.println("홍길동:" +map.get("홍길동"));
		System.out.println("전우치:" +map.get("전우치"));
		System.out.println("손오공:" +map.get("손오공"));
//		remove(key) : key에 일치하는 데이터를 삭제하는 메서드
		map.remove("손오공");
//		삭제된 데이터를 get할 경우 null 출력
		System.out.println("손오공: " + map.get("손오공"));
		System.out.println("홍길동:" +map.get("홍길동"));
		System.out.println("전우치:" +map.get("전우치"));
	}
	
}
