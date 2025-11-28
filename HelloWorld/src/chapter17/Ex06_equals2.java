package chapter17;
class Book6{
	String author;
	@Override
	public boolean equals(Object obj) {
//		비교하고싶은 변수를 확인하는 if문
//		변수가 String이라면 String안에 이미 equals가 오버라이딩 되어있기 때문에
//		변수와 변수를 비교할때 equals사용하여 비교함
//		Object 받아오는 매개변수에서 author변수를 출력하려면 자식 클래스로
//		변경하는 과정이 필요하여 캐스팅을 이용하여 자식클래스로 변경함.
		Book6 myBook2 = (Book6)obj;
		if(this.author.equals(myBook2.author)){
			return true;
		}else {
			return false;
		}		
	}
}
public class Ex06_equals2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Book6 myBook1 = new Book6();
		myBook1.author = "홍길동";
		
		Book6 myBook2 = new Book6();
		myBook2.author = "홍길동";
//		메모리 주소를 기준으로 두개의 객체를 비교하여 같은지 판단
		if(myBook1.equals(myBook2)) {
			System.out.println("두 객체의 author변수의 값은 같습니다.");
		}else {
			System.out.println("두 객체의 author변수의 값은 다릅니다.");
		}
	}

}
