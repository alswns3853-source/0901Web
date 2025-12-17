package org.zerock.company.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.zerock.company.dto.MemberDTO;
import org.zerock.company.mappers.MemberMapper;
import org.zerock.company.vo.MemberVO;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{
    private final MemberMapper memberMapper;

    @Override
    public MemberDTO login(MemberDTO param) {

        MemberVO vo = param.convertVO();

        MemberVO loginVO = memberMapper.login(vo);

        if(loginVO == null || loginVO.getId() == null){
            return null;
        }

        MemberDTO loginDTO =  new MemberDTO(loginVO);

        return loginDTO;
    }

    @Override
    public void join(MemberDTO param) {
        MemberVO vo = param.convertVO();
        memberMapper.join(vo);
    }
}
