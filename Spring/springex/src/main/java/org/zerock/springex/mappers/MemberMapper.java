package org.zerock.springex.mappers;

import org.zerock.springex.vo.MemberVO;

public interface MemberMapper {
    MemberVO login(MemberVO vo);
    void join(MemberVO vo);
}
