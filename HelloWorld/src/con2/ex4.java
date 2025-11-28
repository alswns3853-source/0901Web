package con2;

public class ex4 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 4줄을 출력하는 반복문
		for( int i = 1; i <= 8; i+=2) {
//			공백을 출력하는 반복문 3,2,1,0
			for (int j = 7; j > i; j-=2) {
				System.out.print(" ");
		}
			// 별을 출력하는 반복문
			for(int j = 0; j<i; j++) {
				System.out.print("*");
			}
			   System.out.println();
	}
		int space = 3;
		int star =1;
		// 4줄을 출력하는 반복문
		for(int i=1; i<=4; i++) {
			// 공백을 출력하는 반복문 3,2,1,0
			for(int j=1; j<=space; j++) {
				System.out.print(" ");
			}
			space--;
			
			// 별을 출력하는 반복문 1,3,5,7
			for(int k=1; k<=star; k++) {
				System.out.print("*");
			}
			star+=2; 
			System.out.println();
		}

}
}