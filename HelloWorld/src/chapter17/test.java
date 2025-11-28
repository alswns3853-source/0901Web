package chapter17;

//	데이터베이스에 있는 유저 데이터
class User{
	String id;
	String pw;
	String name;
	@Override
	public String toString() {
//		id를 돌려주는 코드 작성하기	
		return id;
	}	
	@Override
	public boolean equals(Object obj) {
//		id,pw를 비교하는 코드 작성하기
		User loginUser = (User)obj;
		if(this.id.equals(loginUser.id) && this.pw.equals(loginUser.pw)){
			return true;
		}else {
			return false;
		}		
	}
}

public class test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 데이터베이스 데이터
		User user = new User();
		user.id = "홍길동";
		user.pw = "1234";
		// 사용자가 입력한 데이터
		User loginUser1 = new User();
		loginUser1.id = "홍길동";
		loginUser1.pw = "4321";
		System.out.println(user.equals(loginUser1));// false
		// 사용자가 입력한 데이터2
		User loginUser2 = new User();
		loginUser2.id = "홍길동";
		loginUser2.pw = "1234";
		System.out.println(user.equals(loginUser2));// true
	}

}
