package con7;

class Student2{
	private String name;
	private int sno;
	private String dept;
	private int grade;
	private int credit;
	 //생성자
	Student2(String name, int sno, String dept, int grade, int credit) {
		super();
		this.name = name;
		this.sno = sno;
		this.dept = dept;
		this.grade = grade;
		this.credit = credit;
	}
	//getter, setter
	  String getName() {
		 return name;
	 }
	  void setName(String name) {
		 this.name = name;
	 }
	 int getSno() {
		 return sno;
	 }
	 void setSno(int sno) {
		 this.sno = sno;
	 }
	  String getDept() {
		 return dept;
	 }
	  void setDept(String dept) {
		 this.dept = dept;
	 }
	 int getGrade() {
		 return grade;
	 }
	 public void setGrade(int grade) {
		 this.grade = grade;
	 }
	 public int getCredit() {
		 return credit;
	 }
	 public void setCredit(int credit) {
		 this.credit = credit;
	 }
	 public void print() {
			System.out.print("이름:"+getName()+"/ 학번:"+getSno()+"/ 학과:"+getDept()+"/ 학년:"+getGrade()+"/ 이수학점:"+getCredit());
		}
}
class UnderGraduate extends Student2{
	private String club;

	 UnderGraduate(String name, int sno, String dept, int grade, int credit, String club) {
		super(name, sno, dept, grade, credit);
		this.club = club;
	}

	String getClub() {
		return club;
	}

	 void setClub(String club) {
		this.club = club;
	}
	@Override
	public void print() {
		super.print();
		System.out.println("/ 소속동아리:"+getClub());
	}
	
}
class Graduate extends Student2{
	private String assistantType;
	private boolean scholarship;
	
	 Graduate(String name, int sno, String dept, int grade, int credit, String assistantType,
			boolean scholarship) {
		super(name, sno, dept, grade, credit);
		this.assistantType = assistantType;
		this.scholarship = scholarship;
	}

	  String getAssistantType() {
		 return assistantType;
	 }

	  void setAssistantType(String assistantType) {
		 this.assistantType = assistantType;
	 }

	  boolean isScholarship() {
		 return scholarship;
	 }
	  String getScholarship() {
		  return scholarship ? "받음" : "못받음";
	  }

	  void setScholarship(boolean scholarship) {
		 this.scholarship = scholarship;
	 }
	@Override
	public void print() {
		super.print();
		System.out.println("/ 조교 유형: "+getAssistantType()
		+"/ 장학금 여부 :"+getScholarship());
	}
}
public class q6 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		UnderGraduate underGraduate1 = new UnderGraduate("갑",1000,"컴공",3,84,"날자날어");
		underGraduate1.print();
		underGraduate1.setCredit(87);
		underGraduate1.setClub("돌고 돌아");
		underGraduate1.print();
		Graduate graduate1 = new Graduate("을",100,"전자공학",2,51,"교육 조교", false);
		Graduate graduate2 = new Graduate("병",102,"세포생물",3,61,"연구 조교", true);
		graduate1.print();
		graduate2.print();
//		=================출력결
	}

}
