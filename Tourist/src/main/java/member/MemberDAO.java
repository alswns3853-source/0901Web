package member;

import common.DBConnPool;

public class MemberDAO extends DBConnPool {
	public MemberDTO login(MemberDTO param) {
		MemberDTO dto = new MemberDTO();
		try {
		String query = "SELECT * FROM tourist_member "
				+ " WHERE email_id=? AND password=? ";
		psmt = con.prepareStatement(query);
		psmt.setString(1, param.getEmailId());
		psmt.setString(2, param.getPassword());
		rs = psmt.executeQuery();
		if(rs.next()) {
			dto.setEmailId(rs.getString("email_id"));
			dto.setEmailAddress(rs.getString("email_address"));
			dto.setName(rs.getString("name"));
			dto.setPassword(rs.getString("password"));
			dto.setTel(rs.getString("tel"));
			dto.setGender(rs.getString("gender"));
			dto.setAgree(rs.getString("agree"));
			dto.setContent(rs.getString("content"));
			dto.setRegidate(rs.getDate("regidate"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
}
