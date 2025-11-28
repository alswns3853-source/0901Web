package chapter18;

enum Human2 { MAN, WOMAN }
enum Machine2{ TANK, AIRPLANE }

public class Ex02_Enum {
	public static void main(String[] args) {
//		열거형을 사용하여 모호함 피하기
		createUnit(Machine2.TANK);
//		매개변수가 int가 아니기 때문에 MAN은 사용할 수 없음
//		createUnit(Human2.MAN);
//		매개변수가 int가 아니기 때문에 MAN은 사용할 수 없음
//		createUnit(1);
	}
//	매개변수를 열거형으로 사용했기 때문에 열거형이 아닌 데이터는 메서드를 실행할 수 없음
	public static void createUnit(Machine2 kind) {
		switch(kind) {
		case TANK:
			System.out.println("탱크를 만듭니다.");
			break;
		case AIRPLANE:
			System.out.println("비행기를 만듭니다.");
			break;
		}
	}
}
