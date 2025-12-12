package org.zerock.springex.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.zerock.springex.vo.MemberVO;

import java.time.LocalDate;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MemberDTO {
    private String id;
    private String pw;
    private String emailId;
    private String emailAddress;
    private LocalDate regidate;

    public MemberDTO(MemberVO vo) {
        this.id = vo.getId();
        this.pw = vo.getPw();
        this.emailId = vo.getEmailId();
        this.emailAddress = vo.getEmailAddress();
        this.regidate = vo.getRegidate();
    }
    public MemberVO convertVO() {
        return MemberVO.builder()
                .id(this.id)
                .pw(this.pw)
                .emailId(this.emailId)
                .emailAddress(this.emailAddress)
                .regidate(this.regidate)
                .build();
    }
}
