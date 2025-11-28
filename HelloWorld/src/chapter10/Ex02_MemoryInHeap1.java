package chapter10;

public class Ex02_MemoryInHeap1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Book book1 = new Book();
		Book book2 = new Book();
		book1.num = 10;
		book2.num = 20;
		System.out.println(book1.num);
		System.out.println(book1);
		System.out.println(book2.num);
		System.out.println(book2);
		book2 = book1; // book2에 book1의 메모리주소를 저장
		System.out.println(book2.num);
		System.out.println(book2);
		book1.num = 100;
		System.out.println(book1.num);
		System.out.println(book2.num);
		System.out.println(book1);
		System.out.println(book2);
		book2 = null;
		System.out.println(book1);
		System.out.println(book2);
	}

}
