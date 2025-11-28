package con2;

public class ex3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		for( int i = 5; i >= 1; i--) {
			for (int j = 1; j <= i; j++) {
				System.out.print("*");
		}
			System.out.println();
			
	}
		// starEnd : 별을 몇번 출력할지 설정하는 변수
		int starEnd = 5;
		// 몇줄을 출력할지 설정하는 반복문
		for(int i=1; i<=5; i++) {
			// 별을 몇개 출력할지 설정하는 반복문
			for(int j=1; j<=starEnd; j++) {
				System.out.print("*");
				
			}
			// 별 출력횟수를 매 반복마다 1씩 줄여주는 설정
			starEnd--;
			// 별을 모두 출력한 후 줄바꿈을 실행하는 설정
			System.out.println();
		}
		
	

}
}