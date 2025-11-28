package con6;

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
public class q4 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ColorPoint cp = new ColorPoint(5, 5, "YELLOW");
		cp.setPoint(10, 20);
		cp.setColor("GREEN");
		cp.show();
	}

}
