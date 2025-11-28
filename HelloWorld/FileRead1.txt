package chapter24;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

public class Ex04_FlieRead {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		data.txt에서 내용을 읽는 클래스
		try(InputStream in = new FileInputStream("data.txt")){
//			in.read() : 1바이트를 읽어 int자료형으로 반환하는 함수
			int data = in.read();
//			int로 출력했을때
			System.out.println(data);
//			문자열로 출력했을때
			System.out.printf("%c \n", data);
			data = in.read();
			System.out.println(data);
			System.out.printf("%c \n", data);
			while(true) {
//				data 변수에 1바이트 저장
				data = in.read();
//				in.read()에서 -1을 반환하면 다음 데이터가 없으므로 종료
				if(data == -1) break;
//				-1이 아니라면 데이터가 있음으로 실행
				System.out.println(data);
				System.out.printf("%c \n", data);
			}
		}catch(IOException e) {
			e.printStackTrace();
		}
	}

}
