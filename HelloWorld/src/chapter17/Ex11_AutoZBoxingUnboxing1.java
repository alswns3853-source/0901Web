package chapter17;

public class Ex11_AutoZBoxingUnboxing1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		오토 박싱이 일어남 : 리터럴 데이터 10이 INteger자료형에 자동으로 저장
		Integer iObj = 10;
//		리터럴 데이터 3.14가 Double자료형에 자동으로 저장
		Double dObj = 3.14;
//		오토 언박싱 : Integer자료형인 iObj가 자동으로 int자료형에 저장됨
		int num1 =iObj;
//		Double자료형인 dObj가 자동으로 double자료형에 저장됨
		double num2 = dObj;
		Integer iObj2 = num1;
		System.out.println(num1 +" : "+ iObj);
		System.out.println(num2 +" : "+ dObj);
		String str2 = new String("안녕하세요");
		String str = "안녕하세요";
		}

}
