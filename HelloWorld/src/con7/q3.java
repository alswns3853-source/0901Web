package con7;

class Book{
	private String title;
	private int pages;
	private String writer;
	
	public Book(String title, int pages, String writer) {
		this.title = title;
		this.pages = pages;
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getPages() {
		return pages;
	}

	public void setPages(int pages) {
		this.pages = pages;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	@Override
	public String toString() {
		System.out.println("책 이름:"+title);
		System.out.println("페이지 수:"+pages);
		System.out.println("저자:"+writer);
		return title;
	}
	
}
class Magazine extends Book{
	private String date;

	public Magazine(String title, int pages, String writer, String date) {
		super(title, pages, writer);
		this.date = date;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
	@Override
	public String toString() {
		super.toString();
		System.out.println("발매일:"+date);
		return getTitle();
	}
}
public class q3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Magazine magazineA = new Magazine("잡지A",10,"기자A","2010년 2월 25일");
		Magazine magazineB = new Magazine("잡지B",20,"기자B","2010년 3월 8일");
		magazineA.toString();
		magazineB.toString();
	}

}
