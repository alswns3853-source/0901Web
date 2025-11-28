package con3;

import java.util.Arrays;

public class Ex01 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		 int[] intArr = {10,70,50,90,60,30,20};
		 int max = intArr[0]; // 배열에 0번째값, int에 저장 가능한 가장 작은 값
		 int min = intArr[0]; // 배열에 0번째값, int에 저장 가능한 가장 큰 값
//		 int max = Integer.MIN_VALUE;
//	    int min = Integer.MAX_VALUE;
//		 for(int i : intArr) {
//			 if(max<i) {
//				 max = i;
//			 }
//			 if(min>i) {
//				 min = i;
//			 }
//		 }  
//		 System.out.println("최대값:"+max);
//		 System.out.println("최소값:"+min);	
//		 
		 for(int i = 1; i<intArr.length; i++) {
			 if(intArr[i] > max) {
				 max = intArr[i];
			 }
			 if(intArr[i] < min) {
				 min = intArr[i];
			 }
		 }
		 System.out.println("최대값:"+max);
		 System.out.println("최소값:"+min);	
		 // 최대값 구하기
		 max = Arrays.stream(intArr).max().getAsInt();
		 System.out.println("최대값:"+max);
		 min = Arrays.stream(intArr).min().getAsInt();
		 System.out.println("최소값:"+min);
		 
		 //stream 을 이용한 최대값 구하기
		 int streamMax = Arrays.stream(intArr).max().getAsInt();
		 System.out.println("최대값:"+max);
		 //stream을 이용한 최소값 구하기
		 int streamMin = Arrays.stream(intArr).min().getAsInt();
		 System.out.println("최소값:"+min);
	}

}
