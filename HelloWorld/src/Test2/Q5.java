package Test2;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class Q5 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//	[문제5] 5개의 나라 이름과 인구를 입력받아 해시맵에 저장하고, 
//	가장 인구가 적은 나라를 검색하여 출력하는 프로그램을 작성하시오. 
//	이때 다음 해시맵을 이용하시오.
//	HashMap<String, Integer> nations = 
//		new HashMap<String, Integer>();		   
//	나라 이름과 인구를 5개 입력하세요. (예: Korea 5000)
//	나라 이름, 인구 >> Korea 5000
//	나라 이름, 인구 >> China 1000000
//	나라 이름, 인구 >> USA 30000
//	나라 이름, 인구 >> Swiss 2000
//	나라 이름, 인구 >> France 2500
//	제일 인구가 적은 나라는 (Swiss, 2000)
		Scanner sc = new Scanner(System.in);
        HashMap<String, Integer> nations = new HashMap<>();

        System.out.println("나라 이름과 인구를 5개 입력하세요.");

        for (int i = 0; i < 5; i++) {
            System.out.print("나라 이름, 인구 >> ");
            String str = sc.nextLine();
            String[] st= str.split(" ");
            String kuni = st[0];
            int hito = Integer.parseInt(st[1]);
            nations.put(kuni, hito);
        }

        String kuni = null;
        int hito = Integer.MAX_VALUE;

        for (Map.Entry<String, Integer> u: nations.entrySet()) {
            if (u.getValue() < hito) {
                hito = u.getValue();
                kuni = u.getKey();
            }
        }

        System.out.println("가장 인구가 적은 나라는 "+"(" + kuni + ", " + hito + ") ");
    }
}