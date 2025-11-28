package con9;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

class Emp{
	int empno;
	String ename;
	int deptno;
	int sal;
	int comm;
	public Emp(int empno, String ename,int deptno,int sal,int comm) {
		this.empno = empno;
		this.ename = ename;
		this.deptno = deptno;
		this.sal = sal;
		this.comm = comm;
	}
}
public class ex1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		List<Emp> empList = new ArrayList<>();
//		사원번호, 이름, 부서번호, 급여, 커미션 
		empList.add(new Emp(7369,"SMITH",20,800,0));
		empList.add(new Emp(7499,"ALLEN",30,1600,300));
		empList.add(new Emp(7521,"WARD",30,1250,500));
		empList.add(new Emp(7654,"MARTIN",30,1250,1400));
		empList.add(new Emp(7788,"SCOTT",20,3000,0));
		
		int salSum = empList.stream()
				.mapToInt(emp -> emp.sal)
				.sum();
		System.out.println("사원 급여 총합: " + salSum);
		
		double salAvg = salSum / empList.size();
		salAvg = empList.stream()
				.mapToInt(emp -> emp.sal)
				.average().getAsDouble();		
		System.out.println("사원 급여 평균: " + salAvg);
		
		long salpeople = empList.stream()
				.filter(emp -> emp.deptno == 30)
				.count();
		System.out.println("30번 부서 사람 수: " + salpeople);
		
		int salMax = empList.stream()
				.mapToInt(emp -> emp.sal)
				.max()
				.orElse(Integer.MIN_VALUE);
		System.out.println("급여가 제일 높은: " +salMax);	
		
		int salMin = empList.stream()
				.mapToInt(emp -> emp.sal)
				.min()
				.orElse(Integer.MAX_VALUE);
		System.out.println("급여가 가장 적은: " +salMin);
		
		List<String> first = empList.stream()
		        .map(emp -> emp.ename.substring(0, 1) + "*".repeat(emp.ename.length() - 1))
		        .collect(Collectors.toList());
		System.out.println("사원 첫글자:" +first);
		
		empList.stream()
				.map(emp -> emp.ename.charAt(0)
						+ "*".repeat(emp.ename.length()-1)+" ")
				.forEach(ename -> 
				System.out.print(ename));
				System.out.println();
			
		
		empList.stream()
			.forEach(emp->{
				double dayPay = (double) emp.sal/21;
				double hourPay = (double) dayPay/8;
				dayPay = Math.round(dayPay);      
				hourPay = Math.round(hourPay);   
				System.out.println("하루 급여: "+(int)dayPay+"달러");
				System.out.println("시급: "+(int)hourPay+"달러");
			});
				
		empList.stream()
	       .filter(emp -> emp.deptno == 30)
	       .max((e1, e2) -> Integer.compare(e1.sal, e2.sal))
	       .ifPresent(emp -> System.out.println(
	               "급여가 가장 높은 사람: " + emp.ename));
		 		
		    long salCommCount = empList.stream()
					.filter(emp -> emp.sal+emp.comm > 2000)
					.count();
			System.out.println("2000이상인 사람 수: " + salCommCount);
			
	
			
		// stream 실습하기
		// 1. 사원들의 sal 총합을 출력해보자
		// 2. 사원들의 sal 평균을 출력해보자
		// 3. 30번 부서에 있는 사람 수를 출력해보자
		// 4. 사원들 중 가장 급여를 많이 받는 사람을 출력해보자
		// 5. 사원들 중 가장 급여를 적게 받는 사람을 출력해보자
		// 6.사원 이름의 첫글자만 출력하고 나머지는 *로 출력해보자
		// 7. sal는 한달 급여이고 사원들의 월 평균 근무일수는 21일, 하루 근무시간은 8시간일때 하루 급여와 시급을 출력 해보자
		// 8. 30번 부서에서 가장 sal를 많이 받는 사람을 출력 해보자
		// 9. sal와 comm을 더하여 2000이상 받는 사람 수를 출력해보자
					
		
	}

}
