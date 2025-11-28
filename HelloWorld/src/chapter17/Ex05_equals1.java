package chapter17;

class Book5{
	String author;
}

public class Ex05_equals1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Book5 myBook1 = new Book5();
		myBook1.author = "홍길동";
		
		Book5 myBook2 = new Book5();
		myBook2.author = "홍길동";
//		메모리 주소를 기준으로 두개의 객체를 비교하여 같은지 판단
		if(myBook1.equals(myBook2)) {
			System.out.println("두 객체의 참조 id는 같습니다.");
		}else {
			System.out.println("두 객체의 참조 id는 다릅니다.");
		}
	}

}
