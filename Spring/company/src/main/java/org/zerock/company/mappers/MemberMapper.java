package org.zerock.company.mappers;

import org.zerock.company.vo.MemberVO;


public interface MemberMapper {
    MemberVO login(MemberVO vo);
    void join(MemberVO vo);
}
