package chapter18;

interface Human1{
	int MAN = 1;
	int WOMAN = 2;	
}
interface Machine1{
	int TANK = 1;
	int AIRPLANE = 2;
}

public class Ex01_Constans {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		final 상수를 사용했을때의 모호함
//		어떤 데이터가 사용되던 1이나 2라면 실행이 가능하도록 만들어져 있음
		createUnit(Machine1.TANK);
		createUnit(Human1.MAN);
		createUnit(1);
	}
	public static void createUnit(int kind) {
		switch(kind) {
		case Machine1.TANK:
			System.out.println("탱크를 만듭니다.");
			break;
		case Machine1.AIRPLANE:
			System.out.println("비행기를 만듭니다.");
			break;
		}
	}
}
