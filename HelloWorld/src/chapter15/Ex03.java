package chapter15;

import java.util.Arrays;

public class Ex03 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[] studentArr = {100,50,70,90,100,60,30,10,50};
		System.out.println();
		int sum = 0;
		for (int num : studentArr) {
			sum += num;
		}
		System.out.println("합계:"+sum+"점");
		int avg = sum / studentArr.length;
		System.out.println("평균:"+avg+"점");
		// stream 사용
		sum = Arrays.stream(studentArr).sum();
		double avg1 = Arrays.stream(studentArr).average().getAsDouble();
		System.out.println("합계:"+sum+"점");
		System.out.println("평균:"+avg1+"점");
	}

}
