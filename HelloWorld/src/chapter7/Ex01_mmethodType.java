package chapter7;

public class Ex01_mmethodType {

//  main는 프로그램시시 가장 처음 실행되는 부분으로 클래스와 완전히 다른 영억에서 
//	실행되기 때문에 클래스 사용시 반드시 클래스를 선언하여 사용해야함.

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		메서드를 실행하는 방법
//		1. 클래스를 선언하여 클래스 안에 작성한 메서드를 실행
		
        Ex01_mmethodType mt = new Ex01_mmethodType();
//      클래스 안에 있는 메서드를 실행
		mt.sayHello();
//		반환값이 존재하는 메서드는 변수, 매개변수, 출력 용도로 사용해야함
		int result = mt.addToNum(10, 20); // result = 30
		System.out.println(result);  // 30
		System.out.println(mt.addToNum(100, 1000)); // 콘솔창에 1100출력
		// 메서드 안에 메서드 사용
		result = mt.addToNum(30, mt.addToNum(20, 30)); 
		System.out.println(result); // 80
		
		// static 메서드는 class를 선언 없이 사용 가능
		showName();
		
	}
//  반환자료형 메서드이름(매개변수){
//	    메서드 실행 코드;
//	    return 반환 타입에 맞는 변수 혹은 값;
//	}
//	void : 아무것도 반환하지 않는 메서드를 작성
//	int,long,double,String 같은 기본자료형 및 클래스 자료형 사용가능
    void sayHello() {
    	System.out.println("Hello");
//    	return "a"; 반환타입을 void로 설정해서 return을 사용할 수 없음
    }
//  반환타입 : int
//  매개변수 : int num1, int num2
    int addToNum(int num1, int num2) {
    	int result = num1 + num2;
//    	return이 실행되면 메서드를 종료하고 반환값을 메서드가 불린곳으로 돌려줌
    	return result;
//    	return보다 아래에 있는 코드는 절대 실행되지 않기 때문에 에러가 발생함
//    	System.out.println("return보다 아래에 존재하는 코드");
    }
//  메서드에 static을 사용하면 main과 비슷하게 프로그램 시작시 메모리에 탑재하여 
//    클래스를 선언하지 않아도 사용할 수 있는 메서드가 됩니다.
    static void showName() {
    	System.out.println("제 이름은 홍길동 입니다.");
    }
}
