package chapter6;

public class ex05_while1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// while 반복문 : 몇번 반복할지 정해져 있지 않은 경우 사용하는 반복문
//	    int 초기값 = 1;
//	    while(조건식) {
//	    	증감 식;
//	    	반복 해서 실행 할 코드;
//	}
		int i = 1;
		while(i<=5) {
			System.out.println(i+",");
			i++;
		
		
		}
		System.out.println();
		int j=0;
		while(j<5) {
			j++;
			System.out.println(j+",");
		}
		// 100에서 110까지 출력하는 while 문 작성하기
		System.out.println();
		int n = 100;
		while(n<=110) {
			System.out.println(n);
			n++;
		}
		// 2에서 9까지 출력하는 while 문 작성하기
		System.out.println();
		int t = 1;
		while(t<9) {
			t++;
			System.out.println(t);
		}
		//10에서 1까지 출력하는 while 문 작성하기
		System.out.println();
		int in = 10;
		while(in>=1) {
			System.out.println(in);
			in--;
		}
		//5,10,15를 출력하는 while 문 작성하기
		System.out.println();
		int nt = 0;
		while(nt<15) {
			nt+=5;
			System.out.println(nt);
		}
	    
		
	}

}
