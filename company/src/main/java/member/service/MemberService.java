package member.service;

import membership.MemberDAO;
import membership.MemberDTO;


public class MemberService {
	public MemberDTO getMember(String userid, String password) {
		MemberDAO dao = new MemberDAO();
		MemberDTO memberDTO = dao.getMemberDTO(userid, password);
		dao.close();
		return memberDTO;
	}
	public int addMember(String userid,String name, String password, String pw2) {
		MemberDAO dao = new MemberDAO();
		int result = dao.addMember(userid, name, password, pw2);
		dao.close();
		return result;
	}
}
