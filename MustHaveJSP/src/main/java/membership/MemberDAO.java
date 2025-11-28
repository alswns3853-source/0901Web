package membership;

import java.sql.SQLException;

import common.DBConnPool;
import model1.BoardDTO;

// DBConnPool을 상속받아 변수를 따로 선언하지 않아도 DB관련 객체를 자유롭게 사용할 수 있음
public class MemberDAO extends DBConnPool{
//	public MemberDAO(String drv, String url, String id, String pw){
//		super(drv, url, id, pw);
//		}
	
	// 한명의 Member를 찾아서 MemberDTO에 담아 돌려주는 메서드, 로그인 처리
	public MemberDTO getMemberDTO(String uid, String upass) {
		// 변환값 설정
		MemberDTO dto = new MemberDTO();
		// SQL 작성
		String query = "SELECT * FROM member WHERE id=? AND PASS=?";
		try {
			// SQL 실행
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			rs = psmt.executeQuery();
			// 데이터가 1건 검색된다면 실행되는 if문
			if (rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pass"));
				dto.setName(rs.getString(3));
				dto.setRegidate(rs.getString(4));
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		//검색 결과를 반환하는 
		return dto;
	}
	public int addMember(String id, String pass, String name) {
		int inResult = 0;
		String sql = "INSERT INTO member(id,pass,name,regidate)"
			+ "VALUES (?, ?, ? , sysdate)";
		try {
			
		
		psmt = con.prepareStatement(sql);
		psmt.setString(1, id); // 첫번째 ?의 값 설정
		psmt.setString(2, pass); // 두번째 ?의 값 설정
		psmt.setString(3, name); // 세번째 ?의 값 설정
		// executeUpdate() : INSERT, UPDATE, DELETE문을 실행하는 메서드
		 inResult = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return inResult;
	}
}
