package chapter20;

class MyData {
	public static <T> T showData(T data) {
//		제네릭으로 가져온 매개변수 data가 어떤 타입인지 확인하는 if문
		if (data instanceof String) {
			System.out.println("String");
		}else if (data instanceof Integer) {
			System.out.println("Integer");
		}else if (data instanceof Double) {
			System.out.println("Double");
		}
		return data;
	}
}

public class Ex09_GenericMethod {

	public static void main(String[] args) {
//		클래스이름.<제네릭타입>메서드이름(제네릭타입에 맞는 데이터);
		MyData.<String>showData("Hello World");
//		클래스이름.<제네릭타입 생략가능>메서드이름(제네릭타입에 맞는 데이터);
		MyData.showData("Hello World");
		MyData.showData(1);
		MyData.<Integer>showData(1);
		MyData.showData(1.0);
		MyData.<Double>showData(1.0);
	}

}
