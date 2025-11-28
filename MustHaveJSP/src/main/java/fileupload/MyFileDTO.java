package fileupload;

public class MyFileDTO {
	private String idx; // PK
	private String title; // 제목
	private String cate; // 카테고리
	private String ofile; // 원본 파일 이름
	private String sfile; // 파일 저장시의 이름
	private String postdate; // 생성일
	
	public MyFileDTO() {}
	public MyFileDTO(String idx, String title, String cate, String ofile, String sfile, String postdate) {
		this.idx = idx;
		this.title = title;
		this.cate = cate;
		this.ofile = ofile;
		this.sfile = sfile;
		this.postdate = postdate;
	}
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCate() {
		return cate;
	}
	public void setCate(String cate) {
		this.cate = cate;
	}
	public String getOfile() {
		return ofile;
	}
	public void setOfile(String ofile) {
		this.ofile = ofile;
	}
	public String getSfile() {
		return sfile;
	}
	public void setSfile(String sfile) {
		this.sfile = sfile;
	}
	public String getPostdate() {
		return postdate;
	}
	public void setPostdate(String postdate) {
		this.postdate = postdate;
	}
	
	
}
