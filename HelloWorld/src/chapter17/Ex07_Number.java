package chapter17;

public class Ex07_Number {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		자료형.valueOf(매개변수) : 매개변수 안의 데이터를 자료형으로 변경 
		Integer num1 = Integer.valueOf("20");
		Integer value1 = 20;
//		Integer를 int로 변경하여 출력
		System.out.println(num1.intValue()); 
//		Integer를 double로 변경하여 출력
		System.out.println(num1.doubleValue());
		
		Double num2 = Double.valueOf("3.14");
		Double value2 = 3.14;
//		Double을 int로 변경하여 출력
		System.out.println(num2.intValue());
//		Double을 double로 변경하여 출력
		System.out.println(num2.doubleValue());
	}

}
