package chapter9;

public class dept {
	// 부서번호
    private int deptno;
    // 부서이름
    private String dname;
    // 부서위치
    private String loc;
    // getter, setter 자동완서응로 만들기
    // 1. source탭 열기
    // 2. Generate Getters and Setters 열기
    // 3. getter와setter를 생성할 맴버변수를 체크
    // 4. Generate버튼으로 생성
	public int getDeptno() {
		return deptno;
	}
	public void setDeptno(int deptno) {
		if(deptno<0 || deptno>99) {
			this.deptno = 0;
			return;
		} 
		this.deptno = deptno;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		if(dname.length()> 14) {
			System.out.println("14글자 미만으로 입력하세요.");
			this.dname="";
			return;
		}
		this.dname = dname;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		if(loc.length()>13) {
			System.out.println("13글자 이하로 입력해주세요.");
			this.loc = "";
			return;
		}
		this.loc = loc;
	}
}

