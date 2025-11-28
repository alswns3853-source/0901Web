
package con3;



public class Ex06 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        int[] lotto = new int[6];
        for(int i=0; i<6; i++) {
        	int number = (int) (Math.random()*45+1);
        	for(int j=0; j<i; j++ ) {
        		if(lotto[j] == number) {
        			number = (int) (Math.random()*45+1);
        			// 중복되는 번호인경우 다시한번 랜덤 번호를 저장하도록 만듬
        			j=-1;
        		}
        	}
        	// 중복되지 않는 경우 번호를 배열에 저장하고 다음 반복으로
        	lotto[i] = number;
        }
        System.out.println("로또번호");
        for(int number : lotto) {
        	System.out.print("["+number+"]");
        }
	}

}
