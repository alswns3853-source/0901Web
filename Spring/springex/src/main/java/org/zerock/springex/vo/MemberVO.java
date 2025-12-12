package org.zerock.springex.vo;

import lombok.*;

import java.time.LocalDate;

@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberVO {
    private String id;
    private String pw;
    private String emailId;
    private String emailAddress;
    private LocalDate regidate;
}
