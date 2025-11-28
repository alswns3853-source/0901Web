package chapter6;

public class Ex06_do_while {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        int num = 0;
        int count = 0;
        do {
        	System.out.println("조건식이 틀리더라도 한번은 실행됨");
        	num++;
        	if(num%5 != 0 || num%7 != 0) {
        		continue;
        	}
        	count++;
        	System.out.println(num);
        }while(num>100);
        System.out.println("count: " + count);
	}

}
