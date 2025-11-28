package chapter15;

public class Ex10_ForInFor {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int [][] arr = new int[3][3];
		int num = 1;
//		new int[3][3]으로 만들었을 때의 배열 인덱스
//      [0][0],[0][1],[0][2],
//		[1][0],[1][1],[1][2],
//		[2][0],[2][1],[2][2]
		for(int i=0; i<3; i++) {
			for(int j=0; j<3; j++) {
				arr[i][j] = num;
				num++;
			}
		}
		for(int i=0; i<3; i++) {
			for(int j=0; j<3; j++) {
				System.out.print(arr[i][j] + " ");
			}
			System.out.println();
		}
	}

}
