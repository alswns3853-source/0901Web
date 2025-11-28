package chapter4;

public class Ex09_Order {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        // 시험 점수의 평균 구하기
		int 국어 = 60;
		int 수학 = 60;
		int 영어 = 50;
		// 시험점수의 평균이 60점이 넘으면 합격 60점 미만이면 불합격을 출력해보자.
		String 결과 = (국어 + 수학+ 영어) / 3 >= 60 ? "합격" : "불합격"; 
		System.out.println(결과);
		
	}

}
