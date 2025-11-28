package membership;

import java.sql.SQLException;

import common.DBConnPool;


// DBConnPool을 상속받아 변수를 따로 선언하지 않아도 DB관련 객체를 자유롭게 사용할 수 있음
public class MemberDAO extends DBConnPool{
//	public MemberDAO(String drv, String url, String id, String pw){
//		super(drv, url, id, pw);
//		}
	
	// 한명의 Member를 찾아서 MemberDTO에 담아 돌려주는 메서드, 로그인 처리
	public MemberDTO getMemberDTO(String id, String password) {
		// 변환값 설정
		MemberDTO dto = new MemberDTO();
		// SQL 작성
		String query = "SELECT * FROM members WHERE id=? AND PASS=?";
		try {
			// SQL 실행
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			psmt.setString(2, password);
			rs = psmt.executeQuery();
			// 데이터가 1건 검색된다면 실행되는 if문
			if (rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setPw(rs.getString("pass"));
				dto.setPw2(rs.getString("checkpass"));
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		//검색 결과를 반환하는 
		return dto;
	}
	public int addMember(String id, String pass, String name, String pw2) {
		int inResult = 0;
		String sql = "INSERT INTO members(id,name,pw,pw2) "
			+ " VALUES (?, ?, ? , ?)";
		try {
			
		
		psmt = con.prepareStatement(sql);
		psmt.setString(1, id); // 첫번째 ?의 값 설정
		psmt.setString(2, name); // 두번째 ?의 값 설정
		psmt.setString(3, pass); // 세번째 ?의 값 설정
		psmt.setString(4, pw2);
		// executeUpdate() : INSERT, UPDATE, DELETE문을 실행하는 메서드
		inResult = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return inResult;
	}
}
