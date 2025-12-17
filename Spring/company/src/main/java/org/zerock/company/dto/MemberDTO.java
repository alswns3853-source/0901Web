package org.zerock.company.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.zerock.company.vo.MemberVO;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MemberDTO {
    private String id;
    private String name;
    private String pass;
    private String checkpass;

    public MemberDTO(MemberVO vo) {
        this.id = vo.getId();
        this.name = vo.getName();
        this.pass = vo.getPass();
        this.checkpass = vo.getCheckpass();
    }
    public MemberVO convertVO() {
        return MemberVO.builder()
                .id(this.id)
                .name(this.name)
                .pass(this.pass)
                .checkpass(this.checkpass)
                .build();
    }
}
