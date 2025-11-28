package con4;

import java.util.Arrays;
import java.util.Collections;
import java.util.Scanner;

public class Ex05 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[] intArr = new int[10];
		Scanner sc = new Scanner(System.in);
		System.out.print("정수 10개 입력>>"+" ");
		for(int i=0; i<intArr.length; i++) {
        	intArr[i] = sc.nextInt();
        }
//		비교하는 값을 임시로 저장할 변수를 설정
		int num = 0;
//		배열에 개수만큼 실행하는 반복문
		for(int j = 0; j < intArr.length; j++) {
//		for문이 한번 실행될때 가장 큰 수가 제일 뒤로 가도록 작성
		for(int i = 0; i <intArr.length - 1; i++) {
				if(intArr[i] > intArr[i+1]) {
					num = intArr[i]; //임시로 데이터를 저장
					intArr[i] = intArr[i+1];//작은 데이터를 앞에 저장
					intArr[i + 1] = num; //큰 데이터를 뒤에 저장
				}
			}
		}
//		배열에 저장된 내용을 출력하는 반복문
		for(int i : intArr) {
		System.out.print(i + " ");
		}
		System.out.println();
//		정렬을 하기위한 배열을 설정
		int[] intArr2 = {17,3,9,-6,77,234,5,23,-3,1};
//		Arrays.sort(배열) : 오름차순 정렬을 실행하는 메서드
		Arrays.sort(intArr2);
//		Arrays.toString(배열) : 배열을 문자열로 변경하여 출력하는 메서드
		System.out.println(Arrays.toString(intArr2));
		
//		내림차순 정렬을 실행할 시 int가 아닌 Integer로 실행해야 에러가 발생하지 않음
		Integer[] intArr3 = {17,3,9,-6,77,234,5,23,-3,1};
//		Arrays.sort(배열, Collections.reverseOrder()) : 내림차순 정렬을 실행하는 메서드
		Arrays.sort(intArr3, Collections.reverseOrder());
//		Arrays.toString(배열) : 배열을 문자열로 변경하여 출력하는 메서드
		System.out.println(Arrays.toString(intArr3));
	}
}

