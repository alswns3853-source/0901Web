package con2;

public class test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        for(int i= 1; i<=9; i++) {
        	if(i%2 !=1) {
        		continue;
        	}
        for(int j=1; j<=9; j++) {
        	System.out.print(i*j+",");
        }
        System.out.println();
        }
        for(int i=1; i<=15; i+=2) {
        	for (int j = 15; j>i; j-=2) {
        		System.out.print(" ");
        	}
        	for(int j= 0; j<i; j++) {
        		System.out.print("*");
        	}
        	System.out.println();
        }
        for(int i=1; i<14; i+=2) {
        	for ( int j= 0; j<i; j+=2) {
        		System.out.print(" ");
        	}
        	for(int j=14; j>i; j--) {
        		System.out.print("*");
        	}
        	System.out.println();
        }
        
	}

}
