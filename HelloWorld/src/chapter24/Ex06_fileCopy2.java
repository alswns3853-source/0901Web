package chapter24;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.time.Duration;
import java.time.Instant;

public class Ex06_fileCopy2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String src = "미리보기(선수지식,표지,목차,판권).pdf"; // 원본파일
		String dst = "선수지식2.png";
//		BufferedInputStream : 보조 스트림으로 생성자의 매개변수로 기반 스트림을 설정해야함
		try (BufferedInputStream in 
				= new BufferedInputStream(new FileInputStream(src));
				BufferedOutputStream out 
				= new BufferedOutputStream(new FileOutputStream(dst))){
			Instant start = Instant.now();
			int data;
			while(true) {
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
