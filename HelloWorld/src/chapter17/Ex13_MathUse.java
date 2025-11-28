package chapter17;

public class Ex13_MathUse {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		Math에 있는 모든 메서드는 static메서드이기 때문에 객체를 생성할 필요 없음
		System.out.println("4의 제곱근:"+Math.sqrt(4));
		System.out.println("log2(8):"+Math.log(8)/Math.log(2));
		System.out.println("2의3승:"+Math.pow(2, 3));
		System.out.println("원주율:"+Math.PI);
		System.out.println("파이에 대한 Degree:"+Math.toDegrees(Math.PI));
		System.out.println("2파이에 대한 Degree:"+Math.toDegrees(2.0*Math.PI));
		
		System.out.println();
		
		double radian45 = Math.toRadians(45);
		
		System.out.println("싸인45:"+Math.sin(radian45));
		System.out.println("코싸인45:"+Math.cos(radian45));
		System.out.println("탄젠트45:"+Math.tan(radian45));
	}
	public static double baseLog(double x, double base) {
		return Math.log(x) / Math.log(base);
	}
}
