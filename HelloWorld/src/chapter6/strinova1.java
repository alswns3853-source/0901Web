package chapter6;

import java.util.Scanner;

public class strinova1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        Scanner sc = new Scanner(System.in);
        System.out.println("돈의 액수를 입력하세요>>");
        int money = sc.nextInt();
        int count50000 = money/50000; // 오만원1개
        money = money % 50000; // 5만원권을 뺀 나머지 15245
        int count10000 = money/10000; // 만원 1개
        money %= 10000; // 1만원권을 뺀 나머지 5245원
        int count1000 = money/1000; // 천원 5개
        money %= 1000;// 1천원권을 뺀 나머지 245원
        int count500 = money/500; // 오백원 0개
        money %= 500; // 오백원권을 뺀 나머지 245원
        int count100 = money/100; // 백원 2개
        money %= 100; // 백원권을 뺀 나머지 45원
        int count10 = money/10; // 십원 4개
        money %= 10; // 십원권을 뺀 나머지 5원
        int count1 = money/1;
        money %= 1;
        System.out.println("오만원"+count50000+"개, "
        + "만원" +count10000+"개, "
        + "천원" +count1000+"개, "
        + "500원" +count500+"개, "
        + "100원" +count100+"개, "
        + "10원" +count10+"개, "
        +"1원" +count1+"개,");
	}


}
