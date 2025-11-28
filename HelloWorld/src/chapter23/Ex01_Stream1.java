package chapter23;

import java.util.Arrays;
import java.util.stream.IntStream;

public class Ex01_Stream1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int [] arr = {1,2,3,4,5};
		// 스트림 생성
		IntStream stm1 = Arrays.stream(arr);
		// 중간 연산
//		filter(람다식) : 람다식의 결과가 true인 경우 데이터를 포함, false는 제외		
//		1 -> 1%2 == 1 : true
//		2 -> 2%2 == 1 : false
//		3 -> 3%2 == 1 : true
//		4 -> 4%2 == 1 : false
//		5 -> 5%2 == 1 : true
//		true가 나온 데이터는 IntStream에 저장됨
		IntStream stm2 = stm1.filter(n -> n%2 == 1);
//		중간 연산 : 정렬
		IntStream stm3 = stm2.sorted();
		// 최종 연산 : 최종연산은 하나만 사용할 수 있음 
//		filter가 끝난 데이터 1,3,5의 항을 출력
		int sum = stm3.sum();
		System.out.println(sum);
		
//		pipeline : 메서드를 연속해서 작성하는 방식
//		pipeline 기능으로 스트림 사용하기
		sum = Arrays.stream(arr) // 스트림 선언
				.filter(n->n%2==1) // 필터 실행
				.sorted() // 정렬
				.sum(); // 총합
		System.out.println("파이프라인 사용 결과 : "+sum);
	}

}
