package chapter3;

public class Ex03_TypeChange1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int num1 = 1;
		short num2 = 1;
		// 작은 자료형에 큰 자료형을 저장할 수 없음
		// 강제 형 변환 : 캐스팅을 이용한 형 변환
		num2 = (short)num1; 
		System.out.println(num2);
		// 큰 자료형에는 작은 자료형을 저장할 수 있음
		// 자동 형 변환 : num2를 int 자료형으로 변경 후 num1에 저장
		num1 = num2;
		System.out.println(num1 + num2);

	    // 연산시의 형 변환
		int a = 10;
		byte b = 1;
		// int = int+byte => byte 가 자동형변환으로 int 변경됨
	    int result = a+b;
	    // byte = int+byte => int 자료형을 byte 에 저장할 수 없어서 에러 발생
	    byte result2 = (byte)(a+b);
	    
	    // 실수 자료형 연산시의 형 변환
	    float num3 = 1.1f;
	    double num4 = 2.2;
	    double result3 = num3+num4;
	    float result4 = (float)(num3+num4);
	}
}
