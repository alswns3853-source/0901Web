package chapter24;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.time.Duration;
import java.time.Instant;

public class Ex05_FileCopy1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String src = "미리보기(선수지식,표지,목차,판권).pdf"; // 원본파일
		String dst = "선수지식.png";
		try (InputStream in = new FileInputStream(src);
				OutputStream out = new FileOutputStream(dst)){
			Instant start = Instant.now();
			int data;
			while(true) {
//				1바이트씩 읽고 저장하기 때문에 오래걸림
				data = in.read();
				if(data == -1)break;
				out.write(data);
			}
			Instant end = Instant.now();
			System.out.println("복사에 걸린 시간:" 
					+ Duration.between(start, end).toMillis());
		}catch(IOException e) {
			e.printStackTrace();
		}
	}

}
