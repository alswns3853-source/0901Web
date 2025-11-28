package chapter15;

class BoxA4{
	public String name;
	BoxA4(String name){
		this.name = name;
	}
}

public class Ex04_BoxArray {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        // 직접 만든 클래스를 배열로 선언하기
		BoxA4[] ar = new BoxA4[3];
		// 객체를 생성하여 배열에 저장
		ar[0] = new BoxA4("홍길동");
		ar[1] = new BoxA4("전우치");
		ar[2] = new BoxA4("손오공");
		// 저장된 객체를 사용하는 방법
		
		System.out.println(ar[0].name);
		System.out.println(ar[1].name);
		System.out.println(ar[2].name);
		
		// String의 경우에는 new를 사용하여 객체를 만들지 않아도 저장이 가능
		String[]strArr = new String[3];
		strArr[0] = "홍길동";
		strArr[1] = "전우치";
		strArr[2] = "손오공";
		System.out.println(strArr[0]);
		System.out.println(strArr[1]);
		System.out.println(strArr[2]);
		
		
	} 

}
