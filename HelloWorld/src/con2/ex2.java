package con2;

import java.util.Scanner;

public class ex2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in );
		int win = 0;
		int draw = 0;
		int lose = 0;
//	    arr[0]: 가위, arr[1]: 바위, arr[2]: 보
		String[] arr = {"가위", "바위", "보"};
		while(true) {
			System.out.println("가위(1),바위(2),보(3), 종료(4) 중에 선택하세요.>>");
		int player = sc.nextInt();
//		Math.random() : 0~1 사이의 소수점 숫자 출력하는 함수
//		0.1*3 =(int)0.3=0, 0.5*3 = (int)1.5=1 0.9 * 3 = (int)2.7=2
//		(int)(Math.random()*3) = 0~2 사이의 숫자
//		(int)(Math.random()*5) = 0~4 사이의 숫자
//		computer 변수에 1~3 사이의 랜덤한 숫자가 저장됨
		int computer = (int)(Math.random()*3+1);
		if(player==4 || win>=5 ) {
			
			System.out.println("가위바위보 게임을 종료했습니다.");
			break; }// 반복문을 종료 시키는 코드
			 if(player==computer) {
        	 System.out.println("플레이어: "+arr[player-1]+"vs "+arr[computer-1]+" :컴퓨터 비겼습니다.");
        	 draw++;
			 } else if ((player==1 && computer== 3) ||
        	        (player==2 && computer== 1) ||
        	        (player==3 && computer== 2)) {
        	 System.out.println("플레이어: "+arr[player-1]+"vs "+arr[computer-1]+" :컴퓨터 이겼습니다.");
		   win++;
         }
            else if ((player==1 && computer== 2)||
        	         (player==2 && computer==3) ||
        	         (player==3 && computer==1)) {
        	 System.out.println("플레이어: "+arr[player-1]+"vs"+arr[computer-1]+" :컴퓨터 졌습니다.");
          lose++;
         }
            else {
            	System.out.println("잘못된 입력입니다. 1~4 사이의 숫자를 입력하세요");
            	continue;
		}
		   System.out.println("현재 상태 - 승리: " + win + " / 패배: " + lose + " / 비김: " + draw);
        
		}
		
		   System.out.println("게임을 승리하였습니다.");
		
		}
		}	
		
		

