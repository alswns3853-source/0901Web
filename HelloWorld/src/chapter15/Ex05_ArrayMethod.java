package chapter15;

public class Ex05_ArrayMethod {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 0~4까지 저장되어있는 배열 만들기
		int[]arr = makeInArray(3);
		// 배열에 저장되어있는 숫자의 합 저장
		int sum = sum0fArray(arr);
		System.out.println(sum);
	}
	// 메서드의 반환값으로 배열을 사용
	public static int[] makeInArray(int len) {
		// 반환할 배열을 생성
		int[] arr = new int[len];
		for(int i=0; i<len; i++) {
			arr[i] = i;
		}
		//return을 사용하여 배열을 반환
		return arr;
			
	}
	// 매개변수를 배열로 사용하는 메서드
	public static int sum0fArray(int[] arr) {
		int sum = 0;
		for(int i =0; i<arr.length; i++) {
			sum = sum + arr[i];
		}
		return sum;
			
	}
}
