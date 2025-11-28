package con5;

import java.util.Scanner;

class Rect{
//  가로,세로크기를 저장하는 맴버 변수 두개를 선언
	private int width, height;
//	가로,세로 크기를 반드시 설정하여 Rect클래스를 생성하도록 하는 생성자
	public Rect(int width, int height) {
			this.width = width;
			this.height = height;
	}
//	가로, 세로 크기를 곱하여 넓이를 구하는 getArea메서드
	public int getArea() { 
		return width*height; 
		}
//	getter,setter가 없기 때문에 Rect클래스에서 가로,세로 크기를 출력하거나 변경하는 것은 불가능
	
}
public class Ex03 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
        Rect[] rectArr = new Rect[4];
        
        for(int i=0; i<rectArr.length; i++) {
        	System.out.print("너비와 높이 >>");
        	int width = sc.nextInt();
        	int height = sc.nextInt();
        	rectArr[i] = new Rect(width, height);
        	// Rect를 만드는 코드
        }
        System.out.println("저장하였습니다...");
        int sum = 0;
        for(Rect rect : rectArr) {
        	// 각 Rect의 넓이를 더하는 코드
        	sum +=  rect.getArea(); 
        }
        	System.out.println("사각형 전체의 합은 " + sum);
	}
	

}
