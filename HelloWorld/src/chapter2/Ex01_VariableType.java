package chapter2;

public class Ex01_VariableType {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// -128~127 까지 저장 가능
        byte b = 127; 
        // 숫자를 저장할때 가장 많이 사용하는 자료형
        // -21억+21억까지 저장 가능
        // -32768~32767 
        short s = 32767;
        // -2147483648~2147483647
        int i = 2147483647;
        // -9223372036854775808~9223372036854775807
        // 21억이 넘는 값의 경우 대문자 L을 붙여서 사용해야 합니다.
        long l = 2147483648142412341L;
        System.out.println(b);
        System.out.println(s);
        System.out.println(i);
        System.out.println(l); 
        
        //실수 자료형 float(4바이트), double(8바이트) 
        double num1 =1.0000001;
        System.out.println(num1);
        double num2 =2.0000001;
        System.out.println(num2);
        // 자바의 부동 소수점 방식은 소수점 숫자 계산이 정확하지 않다.
        double result = num1 + num2;
        System.out.println(result);
        // float 자로형은 뒤에 f 를 붙여야 합니다.
        float f = 1.001f;
	}
}
