package chapter15;

public class Ex11_PartiallyFilled {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		[0][0],
//		[1][0],[1][1],
//		[2][0],[2][1],[2][2]
		int [][] arr = {
				{11},
				{22,33},
				{44,55,66}
		};
//		2차원 배열을 반복할때 배열안의 배열의 개수를 출력하려면 length를 사용해야 합니다.
		for(int i=0; i<arr.length; i++) {
			for(int j=0; j<arr[i].length; j++) {
				System.out.print(arr[i][j]+" ");
			}
			System.out.println();
		}
	}

}
