package chapter4;

public class Ex08_Condition {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        // 조건연산자, 삼항연산자 
		// 조건식 ? 참(true)일 때 실행 : 거짓(false)일 때 실행 
		int age = 9;
		System.out.println( age>=10 ? "참" : "거짓" );
		
		// num1, num2 중에 더 큰 수를 big 에 저장하세요.
		int num1 = 0;
		int num2 = 1000;
		int big = num1 > num2 ? num1 : num2;
		System.out.println("더 큰수 : " + big);
        int small3 = num1 < num2 ? num1 : num2;
        System.out.println("더 작은 수 : " + small3);
        int small4 = num2 > num1 ? num1 : num2;
        System.out.println("더 작은 수 : " + small4);
		int small1 = 1;
		int small2 = -30;
		int small = small1 < small2? small1 : small2;
		System.out.println("더 작은 수 : " + small);
		
		// 두 숫자의 차이를 구하는 삼항 연산자, 마이너스 값이 나오지 않도록
		int diff = num1 > num2 ? num1-num2 : num2-num1;
		System.out.println("두 수의 차이 :" + diff);
		
	}

}
