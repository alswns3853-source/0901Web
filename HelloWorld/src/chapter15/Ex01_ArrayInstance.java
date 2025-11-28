package chapter15;

public class Ex01_ArrayInstance {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		배열 선언 방법
//		자료형[] 변수이름 = new 자료형[개수];
		int[] array = new int[5];
		long[] longArray = new long[5];
		double[] doubleArray = new double[5];
		String[] stringArray = new String[5];
//		배열이름[위치값] = 저장할값;
//		개수가 5위치값은 0부터 시작하고 4까지 5개의 위치값을 사용할 수 있음		
		array[0] = 10;
		array[1] = 20;
		array[2] = 30;
		array[3] = 40;
		array[4] = 50;
//		array[5] = 60; // 5번은 존재하지 않으므로 에러가 발생 합니다.
//		배열 데이터 출력하기 : 변수이름 뒤에 대괄호를 적고 출력하고 싶은 위치값을 작성
		System.out.println(array[0]);
		System.out.println(array[1]);
		System.out.println(array[2]);
		System.out.println(array[3]);	
		System.out.println(array[4]);
//		System.out.println(array[5]); 5번데이터는 존재하지 않으므로 에러 발생
		
//		배열의 선언과 동시에 데이터 저장하기
		int[] intArr = {5,10,15,20,25};
		System.out.println(intArr[0]);
		System.out.println(intArr[2]);
		System.out.println(intArr[4]);
		String[] strArr = {"홍길동", "전우치", "이순신"};
		System.out.println(strArr[0]+","+strArr[1]+","+strArr[2]);
//		반복문을 이용한 배열에 데이터 저장하기
		int[] intArr2 = new int[5];
//		
		for(int i=0; i<intArr2.length; i++) {
			intArr2[i] = i+10; // 10,11,12,13,14
		}
//		반복문을 이용한 배열의 데이터 출력하기
		for(int i=0; i<intArr2.length; i++){
			System.out.print(intArr2[i]+" ");
		}
		System.out.println();
//		배열을 사용하는 향상된 for문(for each문)
//		for(배열의자료형 배열데이터변수이름 : 배열이름) { 실행할코드; }
		for(int i:intArr2) {
			System.out.print(i+" ");
		}
		System.out.println();
		
		for(String str:strArr) {
			System.out.print(str+" ");
		}
	}

}





