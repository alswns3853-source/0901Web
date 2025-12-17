package org.zerock.company.vo;

import lombok.*;

@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberVO {
    private String id;
    private String name;
    private String pass;
    private String checkpass;
}
