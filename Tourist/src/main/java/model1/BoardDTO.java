package model1;

import java.sql.Date;

public class BoardDTO {
	private String num;
	private String title;
	private String content;
	private String id;
	private java.sql.Date postdate;
	private String visitcount;
	private String name;
	
	public BoardDTO() {}
	
	public BoardDTO(String num, String title, String content, String id, Date postdate, String visitcount,
			String name) {
		this.num = num;
		this.title = title;
		this.content = content;
		this.id = id;
		this.postdate = postdate;
		this.visitcount = visitcount;
		this.name = name;
	}

	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public java.sql.Date getPostdate() {
		return postdate;
	}
	public void Postdate(java.sql.Date postdate) {
		this.postdate = postdate;
	}
	public String getVisitcount() {
		return visitcount;
	}
	public void setVisitcount(String visitcount) {
		this.visitcount = visitcount;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public void setPostdate(Date postdate) {
		this.postdate = postdate;
		// TODO Auto-generated method stub
		
	}
}	
	
