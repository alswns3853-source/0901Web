package chapter17;

public class Ex09_UtilMethod {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Integer n1 = Integer.valueOf(5);
		Integer n2 = Integer.valueOf("1024");
		
		System.out.println("큰수:"+Integer.max(n1,n2));
		System.out.println("작은수:"+Integer.min(n1,n2));
		System.out.println("합:"+Integer.sum(n1,n2));
		
		System.out.println("12의 2진 표현:0B"+Integer.toBinaryString(12));
		System.out.println("12의 8진 표현: 0"+Integer.toOctalString(12));
		System.out.println("12의 16진 표현: 0x"+Integer.toHexString(12));
	}

}
