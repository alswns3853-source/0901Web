package model1;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;

public class BoardDAO extends DBConnPool{
	public int selectCount(String searchWord) {
		int totalCount = 0;
		try {
			String query = "SELECT count(*) FROM tourist_board ";
			// PrepareStatement 사용 방식
			if(searchWord != null && !searchWord.equals("")) {
				query += " WHERE title LIKE ? OR content LIKE ?";
			}
			psmt = con.prepareStatement(query);
			if(query.contains("WHERE")) {
				psmt.setString(1, "%"+searchWord+"%");
				psmt.setString(2, "%"+searchWord+"%");
			}
			rs = psmt.executeQuery();
			rs.next();
			totalCount = rs.getInt(1);
		}catch(Exception e) {
			System.out.println("게시물 수를 구하는 중 예외 발생");
			e.printStackTrace();
		}
		return totalCount;
	}
	public List<BoardDTO> selectList(String searchWord){
		List<BoardDTO> bbs = new Vector<>();
		try {
			String query = "SELECT num,title,content,id,postdate,visitcount FROM tourist_board";
			if(searchWord != null && !searchWord.equals("")) {
				query += " WHERE title LIKE ? OR content LIKE ?";
			}
			
			psmt = con.prepareStatement(query);
			if(query.contains("WHERE")) {
				psmt.setString(1, "%"+searchWord+"%");
				psmt.setString(2, "%"+searchWord+"%");
			}
			rs = psmt.executeQuery();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				bbs.add(dto);
			}
		}catch(Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return bbs;
	}
	public List<BoardDTO> selectListPage(Map<String, Object> map){
		List<BoardDTO> dtoList = new ArrayList<>();
		String query = "SELECT * FROM tourist_board ";
		if(map.get("searchWord")!=null && !map.get("searchWord").equals("")) {
			query += " WHERE title "
				+ " LIKE '%"+ map.get("searchWord") + "%'"
				+ " OR content "
				+ " LIKE '%"+ map.get("searchWord") + "%'";
		}
		query += " ORDER BY num DESC"
				+ " OFFSET (( ? - 1) * ?) ROWS "
				+ " FETCH NEXT ? ROWS ONLY";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("pageNum").toString());
			psmt.setString(2, map.get("pageSize").toString());
			psmt.setString(3, map.get("pageSize").toString());
			rs = psmt.executeQuery();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				dtoList.add(dto);
			}
		}catch(Exception e) {
			System.out.println("공지사항 목록 조회중 예외 발생");
			e.printStackTrace();
		}
		return dtoList;
	}
	
	public int insertWrite(BoardDTO dto) {
		int result = 0;
		try {
			String query = "INSERT INTO tourist_board("
					+ "num, title, content, id,visitcount,postdate)"
					+ " VALUES ("
					+ "SEQ_TORUIST_BOARD_NUM.NEXTVAL ,? ,? ,? ,0,sysdate)";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId());
			result = psmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	public BoardDTO selectView(String num) {
		BoardDTO dto = new BoardDTO();
		String query = "SELECT B.*, M.name "
				+ " FROM tourist_member M "
				+ " INNER JOIN tourist_board B ON M.email_id = B.id "
				+ " WHERE num=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				dto.setName(rs.getString("name"));
				
			}
		}catch(Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}
	public void updateVisitCount(String num) {
		String query = "UPDATE tourist_board "
				+ "SET visitcount = visitcount+1 "
				+ "WHERE num=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			psmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("게시물 조회수 증가 중 예외 발생");
			e.printStackTrace();
		}
	}
	public int updateEdit(BoardDTO dto) {
		int result = 0;
		try {
			String query = "UPDATE tourist_board SET "
					+" title = ? , content = ? "
					+" WHERE num = ? ";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getNum());
			result = psmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("게시물 수정 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	public int deletePost(BoardDTO dto) {
		int result = 0;
		try {
			String query = "DELETE FROM tourist_board WHERE num=?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getNum());
			result = psmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("게시물 삭제 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
}








