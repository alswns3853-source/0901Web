package membership;

public class MemberDTO {
	private String id;
	private String name;
	private String pw;
	private String pw2;
	public MemberDTO() {}
	public MemberDTO(String id, String name, String pw, String pw2) {
		
		this.id = id;
		this.name = name;
		this.pw = pw;
		this.pw2 = pw2;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getPw2() {
		return pw2;
	}
	public void setPw2(String pw2) {
		this.pw2 = pw2;
	}
	
}
