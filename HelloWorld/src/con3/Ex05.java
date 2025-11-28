package con3;

import java.util.Arrays;

public class Ex05 {

	public static void main(String[] args) {
		// TODO Aut o-generated method stub
	    	int[] intArr = {1,3,12,16,11,50,36,27,60,89,100};
	        
	    	int even = 0;
	    	int odd = 0;
	    	
	    	for(int num:intArr) {
	    		if (num %2 == 0) {
	    			even++;
	    		}else {
	    			odd++;
	    		}
	    	}
	    
	    	System.out.println("짝수:"+even+"개");
	    	System.out.println("홀수:"+odd+"개");
	    	
	    	even = (int)Arrays.stream(intArr).filter(i->i%2==0).count();
	    	odd = (int)Arrays.stream(intArr).filter(i->i%2!=0). count();
	    	System.out.println("짝수:"+even+"개");
	    	System.out.println("홀수:"+odd+"개");
	}
	

}
