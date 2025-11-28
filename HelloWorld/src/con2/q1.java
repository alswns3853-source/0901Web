package con2;

public class q1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//        1. 구구단을 짝수단만 출력하도록 프로그램을 만들어 보세요.
//        (continue 사용)
//		2*1 2*2 2*3 2*4...... 2*9
//		3*1 3*1 3*3 3*4...... 3*9
//		4*1 4*2 4*3 4*4...... 4*9
		    //단수를 설정한 for 문
		for(int i=2; i<=9; i++) {
			// 단수에 2를 나눙러 나머지가 0이 아니면 continue 를 실행하여 다음 단으로
			if(i%2 !=0) {
				continue;
			}
			// 곱하는 수를 반복하는 for 문
			for(int j=1; j<=9; j++) {
				// 단수와 곱하는 수를 이용하여 구구단의 결과물을 출력
				System.out.print(i*j+",");
			}
			System.out.println();
		}
	}

}
