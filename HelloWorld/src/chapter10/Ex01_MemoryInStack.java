package chapter10;

public class Ex01_MemoryInStack {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		1. 확인하고싶은 줄에 브레이크 포인트 설정하기: 줄 번호 앞에 더블클릭하기
//		2. 디버그 모드로 실행하기: 실행 버튼 외쪽이 벌레모양 버튼이 디버그 실행 버튼
		Integer num1 = 10;
		Integer num2 = 20;
//		step into버튼: 현재 실행하는 줄에 메서드가 있다면 메서드 안으로 들어가서 디버그 계속함
//		step over버튼: 현재 실행하는 줄에 메서드를 모드 실행하고 다음줄로 넘어가는 기능
		adder(num1, num2);
		System.out.println("------------------");
    }
	public static int adder(int n1, int n2) {
		int result = n1 + n2;
		return result;
	}

}
