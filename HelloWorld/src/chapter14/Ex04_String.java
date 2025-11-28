package chapter14;

public class Ex04_String {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		long startTime = System.currentTimeMillis();
		System.out.println("프로그램이 시작되었습니다.");
		String str = "abcd";
		for(int i=0; i<100000; i++) {
			str += "ab";
		}
		System.out.println("프로그램이 종료되었습니다.");
		System.out.println(str);
		long endTime = System.currentTimeMillis();
		long time = (endTime - startTime);
		System.out.println(time + "밀리초 동안 실행했습니다.");
	}

}
