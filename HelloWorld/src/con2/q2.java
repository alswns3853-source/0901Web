package con2;

public class q2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		for( int i = 1; i <=8; i+=2) {
//			
			for (int j = 1; j < i; j+=2) {
				System.out.print(" ");
		}
			
			for(int j = 8; j>i; j--) {
				System.out.print("*");
			}
			   System.out.println();
	}
		int space = 0;
		int star = 7;
		for(int i=1; i<=4; i++) {
			for(int j=1; j<=space; j++) {
				System.out.print(" ");
			}
			space++;
			for(int k=1; k<=star; k++) {
				System.out.print("*");
			}
			star-=2;
			System.out.println();
		}
		
	}


}
