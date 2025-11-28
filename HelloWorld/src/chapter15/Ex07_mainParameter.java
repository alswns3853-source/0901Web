package chapter15;

public class Ex07_mainParameter {
	// main메서드의 매개변수 args 사용하기
//	프로그램 실행할 때 명령 프롬프트에서 뒤에 적은 내용을 매개변수로 만들어 저장함.
	public static void main(String[] args) {
		// TODO Auto-generated method stub
        for(int i=0; i<args.length; i++) {
        	System.out.println(args[i]);
        }
        
	}

}
