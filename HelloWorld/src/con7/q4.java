package con7;

class Food {
	// 멤버 변수
	private int cal;
	private int cost;
	private int kg;

//생성자
	Food(int cal, int cost, int kg) {
		this.cal = cal;
		this.cost = cost;
		this.kg = kg;
	}

// Getter, Setter
	int getCal() {
		return cal;
	}

	void setCal(int cal) {
		this.cal = cal;
	}

	int getCost() {
		return cost;
	}

	void setCost(int cost) {
		this.cost = cost;
	}

	int getKg() {
		return kg;
	}

	void setKg(int kg) {
		this.kg = kg;
	}

}

class Melon extends Food {
	private String info;

//생성자
	Melon(int cal, int cost, int kg, String info) {
		super(cal, cost, kg);
		this.info = info;
	}

	// Getter, Setter
	String getInfo() {
		return info;
	}

	void setInfo(String info) {
		this.info = info;
	}

	@Override
	public String toString() {
		System.out.println("칼로리:" + getCal());
		System.out.println("가격:" + getCost());
		System.out.println("중량:" + getKg());
		System.out.println("정보:" + getInfo());
		return getInfo();
	}

}

public class q4 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Melon melon1 = new Melon(300, 10000, 2, "머스크 멜론");
		Melon melon2 = new Melon(600, 20000, 3, "네트 멜론");
		melon1.toString();
		melon2.toString();

	}

}
