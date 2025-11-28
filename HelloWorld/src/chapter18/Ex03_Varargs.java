package chapter18;

public class Ex03_Varargs {
	
//	String...변수이름 : String 데이터가 몇개가 사용할지 모르는 경우 사용 가변 인수
	public static void helloEverybody(String...vargs) {
		String[] testArr = vargs; // 가변인수는 배열로 생성
		for(String s: vargs) {
			System.out.print(s+'\t');
		}
		System.out.println();
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		helloEverybody("홍길동");
		helloEverybody("홍길동","전우치");
		helloEverybody("홍길동","전우치","손오공");		
	}

}
