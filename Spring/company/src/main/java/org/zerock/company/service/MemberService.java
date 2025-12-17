package org.zerock.company.service;

import org.zerock.company.dto.MemberDTO;

public interface MemberService {
    MemberDTO login(MemberDTO dto);
    void join(MemberDTO dto);
}
