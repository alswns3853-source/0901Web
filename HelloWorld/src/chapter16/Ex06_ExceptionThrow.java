package chapter16;

public class Ex06_ExceptionThrow {
	public static void myMethod1(int n) {
		myMethod2(n,0);
	}
	public static void myMethod2(int n1, int n2) {
		int r = n1/n2;
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			myMethod1(3);
		}catch(Throwable e) {
//			Throwable을 사용하면 메서드 안에서 예외가 발생했을 경우 예외처리가 가능
			e.printStackTrace();
		}	
		System.out.println("Exception Throw!!!");
	}

}
