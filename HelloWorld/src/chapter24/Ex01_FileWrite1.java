package chapter24;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

public class Ex01_FileWrite1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		try ~ wit ~ resource 문
//		try 괄호안에 선언한 클래스는 자동으로 close()를 실행주는 문법
		try(OutputStream out = new FileOutputStream("data2.txt"); ){
			out.write(65);
			out.write(66);
			out.write(67);
			out.write(68);
			out.write(123);
//		파일 관련 예외는 IOException으로 대부분 처리 가능
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
