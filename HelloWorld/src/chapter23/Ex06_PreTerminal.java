package chapter23;

import java.util.Arrays;
import java.util.List;

public class Ex06_PreTerminal {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		List<Integer> list = Arrays.asList(1,3,5,7,9);
		// 합계
		int sum = list.stream().mapToInt(n->n.intValue()).sum();
		System.out.println("sum = "+sum);
		// 개수
		long cnt =list.stream().count();
		System.out.println("count= "+cnt);
		// 평균
		double avg = list.stream()
				.mapToInt(Integer::intValue)
				.average()
				.getAsDouble();
		System.out.println("avg = "+avg);
		// 최소값
		int min = list.stream()
				.mapToInt(Integer::intValue)
				.min()
				.getAsInt();
		System.out.println("min = " + min);
		// 최대값
		int max = list.stream()
				.mapToInt(Integer::intValue)
				.max()
				.getAsInt();
		System.out.println("max = " + max);	
	}
	
}
