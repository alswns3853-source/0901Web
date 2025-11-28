package chapter14;

public class Ex02_StringBuilder {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		System.currentTimeMillis() : 1970년1월1일부터 현재까지의 1/1000초 단위로 반환
		long startTime = System.currentTimeMillis();
		System.out.println("프로그램이 시작되었습니다.");
//		StringBuilder클래스
//		문자열을 변경하는 코드를 많이 실행해야하는 경우 사용하는 클래스
//		String에 사용하여 변경하는 것보다 훨씬 빠르게 처리할 수 있음
		StringBuilder str =new StringBuilder("abcd");
		for(int i=0; i<100000; i++) {
			str.append("ab");
		}
		System.out.println("프로그램이 종료되었습니다.");
		System.out.println(str);
		long endTime = System.currentTimeMillis();
		long time = (endTime - startTime);
		System.out.println(time + "밀리초 동안 실행했습니다.");
	}

}
