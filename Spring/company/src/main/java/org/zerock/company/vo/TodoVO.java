package org.zerock.company.vo;

import lombok.*;


import java.util.Date;

@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TodoVO {
    private Long num;
    private String title;
    private String content;
    private String id;
    private Date postdate;
    private int visitcount;
}
