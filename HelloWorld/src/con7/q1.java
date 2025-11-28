package con7;
class Student{
	int sno;
	String name;
	String dept;
	int[]scores = new int[3];
	int sum;
	double avg;
	int rank;
//	생성자(학번, 이름, 학과, 성적1, 정적2, 성적3)
	Student(int sno, String name, String dept, int score1, int score2, int score3){
		this.sno = sno;
		this.name = name;
		this.dept = dept;
		this.scores[0] = score1;
		this.scores[1] = score2;
		this.scores[2] = score3;
		this.avg = getAvg();
	}
	int getSum() {
		int sum = 0;
		for(int score : scores) {
			sum+=score;
		}
		return sum;
	}
	double getAvg() {
		return (scores[0]+scores[1]+scores[2])/3;
	}
	int getRank(Student[] students) {
		for(int i=0; i<2; i++) {
			int rank = 1;
			if(students[i].avg>avg) {
				rank++;
			}
		}
		this.rank = rank;
		return rank;
	}
	void print() {
		System.out.println(sno+" "+name+" "+dept+" "+scores[0]
				+" "+scores[1]+" "+scores[2]+" "+getSum()+" "+avg+" "+rank);
	}
}
public class q1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Student[] students=new Student[3]; 
		students[0] = new Student(1,"홍길동", "영문",80,70,80);
		students[1] = new Student(2,"박경미", "컴공",70,80,75);
		students[2] = new Student(3,"하성호", "전컴",80,85,90);
		for(Student s:students) {
			s.getRank(students);
		}
		System.out.println("학번 이름 학과 성적1 성적2 성적3 총점 평균 석차");
		for(Student s:students) {
			s.print();
		}
	}

}
