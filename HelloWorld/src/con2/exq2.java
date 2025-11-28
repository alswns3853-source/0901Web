package con2;

public class exq2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//2*1=2 2*2=4
		//3*1=3 3*2=6 3*3=9
		//4*1=4 4*2=8 4*3=12 4*4=16
		for(int i=2; i<=9; i++) {
			for(int j=1; j<=9; j++) {
				// 단수와 곱하는 수를 이용하여 구구단의 결과물을 출력
				
				System.out.print(i*j+",");
				if(i==j) {
					break;
				}
			}
			System.out.println();
		}
	}

}
