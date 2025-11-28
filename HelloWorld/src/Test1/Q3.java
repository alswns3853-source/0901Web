package Test1;

class Point {
    private int x, y;

    public Point(int x, int y) {
        this.x = x;
        this.y = y;
    }
    public int getX() {
        return x;
    }
    public int getY() {
        return y;
    }
    protected void move(int x, int y) {
        this.x = x;
        this.y = y;
    }
}
class ColorPoint extends Point{
	private String color;
	public ColorPoint(int x, int y, String color) {
		super(x,y);
		this.color = color;
	}
	void setPoint(int x, int y) {
		move(x,y);
	}
	void setColor(String color) {
		this.color = color;
	}
	void show() {
		System.out.println(color+"색으로("+getX()+","+getY()+")");
	}
}
public class Q3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//[문제3] 작성할 클래스명: ColorPoint 클래스
//2차원 상의 한 점을 표현하는 Point 클래스는 다음과 같습니다.
//  class Point {
//    private int x, y;
//
//    public Point(int x, int y) {
//        this.x = x;
//        this.y = y;
//    }
//    public int getX() {
//        return x;
//    }
//    public int getY() {
//        return y;
//    }
//    protected void move(int x, int y) {
//        this.x = x;
//        this.y = y;
//    }
//}
//다음 main()과 실행 결과를 참고하여 Point를 상속받은 ColorPoint 클래스(main() 포함)를 작성하세요.
//  public static void main(String[] args) {
//    ColorPoint cp = new ColorPoint(5, 5, "YELLOW");
//    cp.setPoint(10, 20);
//    cp.setColor("GREEN");
//    cp.show();
//}
//  [실행 결과]
//  GREEN색으로 (10, 20)
		ColorPoint cp = new ColorPoint(5, 5, "YELLOW");
	    cp.setPoint(10, 20);
	    cp.setColor("GREEN");
	    cp.show();
	}

}
