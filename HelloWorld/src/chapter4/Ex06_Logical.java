package chapter4;

public class Ex06_Logical {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        // 논리 연산자
		// && : true&&true=true, true&&false=false, false&&false=false
		System.out.println("true && true : " + (true && true) );
		System.out.println("true && false : " + (true && false) );
		System.out.println("false && true : " + (false && true) );
		System.out.println("false && false : " + (false && false) );
		int age = 10;
		int tall = 130;
		boolean ticket = true;
		System.out.println("롤러코스터 탑승 조건은 나이가10살 이상, "
				+ "키가 130cm이상이고 티켓이 있어야합니다.");
		System.out.println("롤러 코스터 탑승 가능 여부 : "
				+(age>=10 && tall>=130 && ticket));
		// ||(Or 연산자) : true||true=true, true||false=true, false||false=false
		// 간식 고르기 : 사과, 바나나, 과자, 아이스크림 이중에 하나만 있으면 간식을 먹을 수 있음
		// 우산 가져가기 : 비가오거나 눈이 올 때 우산 가져가야함
		System.out.println("true || true : " + (true || true) );
		System.out.println("true || false : " + (true || false) );
		System.out.println("false || true : " + (false || true) );
		System.out.println("false || false : " + (false || false) );
		// !(Not 연산자) : !true=false, !false=true
		System.out.println("!true : "+!true);
		System.out.println("!false : "+!false);
		System.out.println("1000미만 2000초과 계산식을 작성하자");
		int x = 500;
		System.out.println("x<1000 || x>2000 :"+ (x<1000 || x>2000));
		System.out.println("!(x>=1000 && x<=2000) :" + !(x>=1000 && x<=2000));
		
		// 시험 합격 조건(or 연산자)
		// 국어, 수학, 영어 중 90점이상 과목이 있다면 true 를 출력합니다.
		int 국어 = 95;
		int 수학 = 80;
		int 영어 = 70;
		System.out.println("국어, 수학, 영어 중 90점이상 "
				+ "과목이 있다면 합격입니다.");
		System.out.println("시험 합격 여부 : "
				+(국어>=90 || 수학>=90 || 영어>=90));
		
		System.out.println();
		// 비행기 탑승 가능 여부(And 연산자)
		// 비행기를 타려면 여권, 비행기표가 있어야 하고 9시 이전에 도착해야 true 로 출력됩니다.
		boolean 여권 = false;
		boolean 비행기표 = true;
		int 현재시간 = 10;
		System.out.println("비행기를 타려면 여권, 비행기표, 9시 이전에 도착해야 합니다.");
        //System.out.println(여권==true && 비행기표==true && 현재시간 <9);
		System.out.println("비행기 탑승 여부: "+(여권 && 비행기표 && 현재시간 <9));
		
		//논리 연산자 사용시의 주의점
		// 최단 거리 평가(SCE)
		// 1. And 연산(&&) : 앞쪽 조건에서 false 가 나오면 
        //		       뒤의 조건은 계산하지 않고 결과를 false 로 출력함
		// 2. Or 연산(||) : 앞쪽 조건에서 true 가 나오면
		//             뒤쪽 조건은 계산하지 않고 결과를 true 로 출력함
	    
		
	} 
	
}
