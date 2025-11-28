package chapter4;

public class Ex02_Assignment {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// = :대입 연산자
		int count = 0;
		// +=, -=, *=, /=, %= : 복합 대입 연산자
		count += 5000; // => count = count+5000
	    System.out.println(count);
		count = count+1; // => count+=1
		System.out.println(count);
		count -= 5; // => count - 5
		System.out.println(count);
		count *= 10; // => count * 10
        System.out.println(count);
        count /= 2; // => count / 2
        System.out.println(count);
        count %= 2; // => count % 2
        System.out.println(count);
        
	}

}
