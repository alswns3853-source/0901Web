package con6;

class Circle {
	private int radius;

	public Circle(int radius) {
		this.radius = radius;
	}

	public int getRadius() {
		return radius;
	}

	void show() {
		System.out.println("Waffle, 반지름 = 5 ");
	}
}

//final을 붙이면 NamedCircle은 상속할 수 없는 클래스로 변경됨
final class NamedCircle extends Circle {
	private String name;

	public NamedCircle(int radius, String name) {
		super(radius);
		this.name = name;
		// TODO Auto-generated constructor stub
	}
//	final을 붙이면 오버라이딩 할 수 없는 메서드로 변경됨
	final void show() {
		System.out.println(name+", 반지름 = "+getRadius());
	}

}

public class ex01 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		NamedCircle w = new NamedCircle(5, "Waffle");
		w.show();
//		Waffle,반지름 = 5
	}

}
