package chapter3;

public class Ex02_final {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 상수 : 변경되지 않는 값;
		// 1. 개발자들끼리 고정된 값을 공유해야할 때 
		// 2. 재사용성을 높이고 싶을 때
		// 3. 보안성을 높이고 싶을 때
		
		// final 자료형 변수이름 = 값;
        final double PI = 3.14;
        final int MAX_SIZE = 100;
        System.out.println(PI*MAX_SIZE);
        // 상수는 한번 값을 설정하면 바꿀 수 없음
//        PI = 3.141592;
//        MAX_SIZE = 200;
        // Integer.MAX_VALUE : int 에 저장할 수 있는 최대값
        Integer i = Integer.MAX_VALUE;
        System.out.println(i);
        // Bye.MAX_VALUE : byte 에 저장할 수 있는 최대값
        Byte b = Byte.MAX_VALUE;
        System.out.println(b);
	}

}
