package chapter18;

// 어노테이션 : 자바 소스코드에 추가하여 사용할 수 있는 데이터의 일종
//@Override: 오버라이딩 할때 매서드명을 잘못적는 실수를 방지하는데 사용
//@Deprecated: 아직은 호환성을 위해 존재하지만 이후에 사라질 수 있는 클래스 또는 메서드
//@SupressWarnigs: Deprecated된 클래스 또는 메서드는 경고를 표시하는데
//				   어노태이션을 사용하면 경고를 표시하지 않도록 설정할 수 있음.
interface Unit4{
	@Deprecated
	public void move(String str);
	public void run(String str);
}
class Human4 implements Unit4{
	@Override
	@SuppressWarnings("deprecation")
	public void move(String str) {
		System.out.println(str);
	}
	@Override
	public void run(String str) {
		System.out.println(str);		
	}
}
public class EX04_Annotation {

	public static void main(String[] args) {
		@SuppressWarnings("deprecation")
		// TODO Auto-generated method stub
		Unit4 unit = new Human4();
		unit.move("인간형 유닛이 이동합니다.");
		unit.run("인간형 유닛이 달립니다.");
	}

}
