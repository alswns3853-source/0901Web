package Test1;

class StudentScore {
	private String sno;
	private int kor;
	private int eng;
	private int math;
	private int sum;
	private double avg;

	public String getSno() {
		return sno;
	}

	public void setSno(String sno) {
		this.sno = sno;
	}

	public int getKor() {
		return kor;
	}

	public void setKor(int kor) {
		this.kor = kor;
	}

	public int getEng() {
		return eng;
	}

	public void setEng(int eng) {
		this.eng = eng;
	}

	public int getMath() {
		return math;
	}

	public void setMath(int math) {
		this.math = math;
	}

	public int getSum() {
		return sum;
	}

	public void setSum(int sum) {
		this.sum = sum;
	}

	public double getAvg() {
		return avg;
	}

	public void setAvg(double avg) {
		this.avg = avg;
	}

	public StudentScore(String sno, int kor, int eng, int math) {
		this.sno = sno;
		this.kor = kor;
		this.eng = eng;
		this.math = math;
		this.sum = kor + eng + math;
		this.avg = sum / 3.0;
		
	}

	void printScore() {
		System.out.printf("%s %d %d %d %d %.1f\n", sno, kor, eng, math, sum, (int)avg+ 0.0);
	}
}

public class Q4 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//[문제4] 작성할 클래스명: StudentScore 클래스
//학생별 교과목 점수와 총점, 평균을 구해서 아래와 같이 출력하는 프로그램을 만들어 봅니다.
//  학생번호   국어   영어   수학    총점    평균
//=============================================
//1번 학생:   80     60     70     210     70.0
//2번 학생:   90     95     80     265     88.0
//3번 학생:   75     80    100     255     85.0
//4번 학생:   80     70     95     245     81.0
//5번 학생:  100     65     80     245     81.0
//학생 다섯명에 대한 국어, 영어, 수학 세 과목별 점수는 아래의 2차원 배열로 준비합니다.
//int[][] scores = {
//    {80,60,70}, {90,95,80}, {75,80,100}, {80,70,95}, {100,65,80}
//};
		StudentScore[] students = new StudentScore[5];
		int[][] scores = { { 80, 60, 70 }, { 90, 95, 80 }, { 75, 80, 100 }, { 80, 70, 95 }, { 100, 65, 80 } };
		students[0] = new StudentScore("1번 학생:", scores[0][0],   scores[0][1],    scores[0][2]);
		students[1] = new StudentScore("2번 학생:", scores[1][0],   scores[1][1],    scores[1][2]);
		students[2] = new StudentScore("3번 학생:", scores[2][0],   scores[2][1],    scores[2][2]);
		students[3] = new StudentScore("4번 학생:", scores[3][0],	  scores[3][1],    scores[3][2]);
		students[4] = new StudentScore("5번 학생:", scores[4][0],   scores[4][1],    scores[4][2]);
		
		System.out.println("학생번호  국어 영어 수학 총점 평균");
		System.out.println("================================================");
		for (StudentScore s : students) {
			s.printScore();
		}

	}

}
