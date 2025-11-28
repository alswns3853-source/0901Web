package con7;

class Phone{
	private String maker;
	private int price;
	private String type;
	 
	Phone(String maker, int price, String type) {
		this.maker = maker;
		this.price = price;
		this.type = type;
	}
	 String getMaker() {
		return maker;
	}
	 void setMaker(String maker) {
		this.maker = maker;
	}
	 int getPrice() {
		return price;
	}
	 void setPrice(int price) {
		this.price = price;
	}
	String getType() {
		return type;
	}
	 void setType(String type) {
		this.type = type;
	}
	
}

class SmartPhone extends Phone{
	private String osType;
	private String osVersion;
	private int memory;
	private boolean camera;
	private boolean bluetooth;
	
	SmartPhone(String maker, int price, String type, String osType, String osVersion, int memory, boolean camera,
			boolean bluetooth) {
		super(maker, price, type);
		this.osType = osType;
		this.osVersion = osVersion;
		this.memory = memory;
		this.camera = camera;
		this.bluetooth = bluetooth;
	}

	 String getOsType() {
		return osType;
	}

	 void setOsType(String osType) {
		this.osType = osType;
	}

	 String getOsVersion() {
		return osVersion;
	}

	 void setOsVersion(String osVersion) {
		this.osVersion = osVersion;
	}

	 int getMemory() {
		return memory;
	}

	 void setMemory(int memory) {
		this.memory = memory;
	}

	public boolean isCamera() {
		return camera;
	}
// 카메라 지원 여부를 글자로 출력하는 메서드
	public String getCamera() {
		return camera ? "지원" : "미지원";
	}
	public void setCamera(boolean camera) {
		this.camera = camera;
	}
	public String getBluetooth() {
		return bluetooth ? "지원" : "미지원";
	}
	public boolean isBluetooth() {
		return bluetooth;
	}

	public void setBluetooth(boolean bluetooth) {
		this.bluetooth = bluetooth;
	}
	// 지원여부 출력 메서드
	public String getBool(boolean bool) {
		return bool? "지원" : "미지원";
	}
	@Override
	public String toString() {
		System.out.println("제조사:"+getMaker());
		System.out.println("가격:"+getPrice());
		System.out.println("통신타입:"+getType());
		System.out.println("운영체제 타입:"+getOsType());
		System.out.println("운영체제 버전:"+getOsVersion());
		System.out.println("내부 메모리:"+getMemory());
		System.out.println("카메라 장착 여부:"+getCamera());
		System.out.println("블루투수 지원 여부:"+getBool(bluetooth));
		return getMaker()+ " " + getOsType();
	}
	
}

public class q5 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SmartPhone sp1 = new SmartPhone("삼성", 1000000, "2g","안드로이드"
				,"3.1.4",4,true,false);
		sp1.toString();
				
	}

}
