package member.service;

import membership.MemberDAO;
import membership.MemberDTO;


public class LoginService {
	public MemberDTO getMember(String userId, String userPwd) {
		MemberDAO dao = new MemberDAO();
		MemberDTO memberDTO = dao.getMemberDTO(userId, userPwd);
		dao.close();
		return memberDTO;
	}
}
