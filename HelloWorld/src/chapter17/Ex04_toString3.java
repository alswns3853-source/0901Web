package chapter17;

class Book4{
	String author;
	@Override
	public String toString() {
//		클래스이름@메모리주소 대신에 저자의 이름을 출력하도록 오버라이딩
		return author;
	} 
}

public class Ex04_toString3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		인스턴스 생성
		Book4 myBook = new Book4();
//		저자 데이터 저장
		myBook.author = "홍길동";
//		저자 데이터 출력
		System.out.println("myBook.author:"+myBook.author);
//		toString()을 실행해 저자 데이터를 출력
		System.out.println("myBook.toString():"+myBook.toString());
//		System.out.println()의 경우 객체를 매개변수로 사용하면 toString()을 실행함
		System.out.println("myBook:"+myBook);		
	}

}
