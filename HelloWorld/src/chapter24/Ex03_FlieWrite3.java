package chapter24;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

public class Ex03_FlieWrite3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		파일 관련 스트림 사용시 반드시 예외처리가 필요함
		OutputStream out = null;
		try {
//			파일을 생성하는 코드
			out = new FileOutputStream("data.txt");
//			바이트로 65는 메모장에서 A를 의미함
//			write()를 이용하여 data.txt에 65를 저장
			out.write(65);
			out.write(66);
			out.write(67);
			out.write(68);
			out.write(123);
//		파일 관련 예외는 IOException으로 대부분 처리 가능
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (out != null) {
//				 close() 실행시에도 예외처리가 필요함
				try {
//					열려있는 파일을 닫는 역할을 하는 메서드
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}

			}
		}
	}
}
