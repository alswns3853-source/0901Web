package chapter20;
// T에는 Number를 상속 받는 클래스만 설정할 수 있음.
class Camp8<T extends Number>{
	private T ob;
	public void set(T o) {
		ob = o;
	}
	public T get() {
		return ob;
	}
}
public class Ex08_BoundedCamp {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Camp8<Integer> iBox = new Camp8<>();
		iBox.set(24);
		Camp8<Double> dBox = new Camp8<>();
		dBox.set(5.97);
		System.out.println(iBox.get());
		System.out.println(dBox.get());
		
//		String은 Number를 상속받지 않기 때문에 Camp8에는 사용할 수 없음
//		Camp8<String> sBox = new Camp8<>();
	}

}
