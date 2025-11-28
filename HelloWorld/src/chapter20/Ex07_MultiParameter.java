package chapter20;
class Camp7<T1, T2>{
	private T1 param1;
	private T2 param2;
	public void set(T1 o1, T2 o2) {
		param1 = o1;
		param2 = o2;
	}
	@Override
	public String toString() {
		return param1 + "&" + param2;
	}
}
public class Ex07_MultiParameter {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Camp7<String, Integer> camp = new Camp7<>();
//		Camp7에 String,Double을 저장하는 camp2만들기
		Camp7<String, Double> camp2 = new Camp7<>();
//		Camp7에 Integer, String을 저장하는 camp3만들기
		Camp7<Integer, String> camp3 = new Camp7<>();
//		Camp7에 Long, Byte를 저장하는 camp4만들기
		Camp7<Long, Byte> camp4 = new Camp7<>();
		camp.set("Apple", 25);
		camp2.set("Banana", 4.5);
		camp3.set(30, "fish");
		camp4.set(999999999999999999L, (byte)127);
		System.out.println(camp);
		System.out.println(camp2);
		System.out.println(camp3);
		System.out.println(camp4);
	}

}
