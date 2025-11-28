package chapter5;

public class Ex01_print {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// System.out.print(변수 혹은 숫자 혹은 문자 작성)
		System.out.print("엔터를 치지 않는 콘솔 출력 함수");
        System.out.println("마지막에 엔터를 쳐주는 콘솔 출력 함수");
        System.out.println("println");
        
        String name = "홍길동";
        System.out.print(name + ",");
        int age = 20;
        System.out.print(age + ",");
        String phone = "010-1234-5678";
        System.out.print(phone);
        
        System.out.println();
        
        System.out.println(name + "," + age + "," + phone);
        
        // System.out.printf() : 포맷문자열을 이용하여 변수를 출력하는 방식
        System.out.printf("정수:%d, 실수:%.2f, 한글자:%c, 문자열:%s"
        		              ,10,  3.14,       'A',  "ASD"  );
        System.out.println();
        System.out.println("정수:"+10+", 실수:"+3.14+", 한글자:"+'A'+", 문자열:"+"ASD");
        System.out.printf("%s, %d, %s", 
        		          name,age,phone);
        
	}

}
