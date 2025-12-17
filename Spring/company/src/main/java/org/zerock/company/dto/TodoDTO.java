package org.zerock.company.dto;

import jakarta.validation.constraints.NotEmpty;
import lombok.*;
import org.zerock.company.vo.TodoVO;

import java.util.Date;

@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@EqualsAndHashCode
public class TodoDTO{
    private Long num;
    @NotEmpty
    private String title;
    @NotEmpty
    private String content;
    private String id;
    private Date postdate;
    private int visitcount;

    public TodoDTO(TodoVO vo){
        this.num = vo.getNum();
        this.title = vo.getTitle();
        this.content = vo.getContent();
        this.id = vo.getId();
        this.postdate = vo.getPostdate();
        this.visitcount = vo.getVisitcount();
    }
    public TodoVO convertVO(){
        return TodoVO.builder()
                .num(this.num)
                .title(this.title)
                .content(this.content)
                .id(this.id)
                .postdate(this.postdate)
                .visitcount(this.visitcount)
                .build();
    }
}

