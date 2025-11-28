package con7;

class Person {
	private String name;
	private String address;
	private String tel;

	public Person(String name, String address, String tel) {
		super();
		this.name = name;
		this.address = address;
		this.tel = tel;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	void print() {
		System.out.println("이름:" + getName() + ", " + 
				"주소:" + getAddress() + ", " + 
				"전화번호:" + getTel());
	}
}
class Customer extends Person{
	private int customerNumber;
	private int mileage;
	
	public Customer(String name, String address, String tel, int customerNumber, int mileage) {
		super(name, address, tel);
		this.customerNumber = customerNumber;
		this.mileage = mileage;
	}

	public int getCustomerNumber() {
		return customerNumber;
	}

	public void setCustomerNumber(int customerNumber) {
		this.customerNumber = customerNumber;
	}

	public int getMileage() {
		return mileage;
	}

	public void setMileage(int mileage) {
		this.mileage = mileage;
	}
	
	void print() {
		System.out.println("이름:"+getName()+", "
				+"주소:"+getAddress()+", "
				+"전화번호:"+getTel()+", "
				+"고객번호:"+customerNumber+", "
				+"마일리지:"+mileage);
		
	}
	
}
public class q2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Person person = new Person("홍길동","부산광역시","010-1234-5678");
		Customer customer = new Customer("이순신","창원시","010-8765-4321",25101601,1000);		
		person.print();	
		customer.print();
	}

}
