package chapter4;

public class Ex05_Compare {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 비교연산자의 결과는 true,false 로 저장되기 때문에 boolean 자료형으로 저장
		boolean value = 1>2;
		System.out.println(value);
		int num1 = 10;
		// 비교 연산자 사용시 변수는 앞에 작성하기
		System.out.println(num1>5); // O
		System.out.println(5<num1); // 앞에 숫자를 사용하는 방식은 X
		// " 출력할 문자열" + (계산식) : 콘솔에 출려할때 설명문을 작성하는 방식
		System.out.println("2>=1 : " + (2>=1));
		System.out.println("2<=1 : " + (2<=1));
		// 1.0은 double, 1은 int 자료형 이지만 자동 형 변환으로 인해
		// int 인 1이 double 로 변경되어 계산됨
		// 비교연산자 사용시에도 자동 형 변환이 실행됨
		System.out.println("1.0 == 1 : " + (1.0==1));
		System.out.println("1.0 != 1 : " + (1.0!=1));
    }

}
