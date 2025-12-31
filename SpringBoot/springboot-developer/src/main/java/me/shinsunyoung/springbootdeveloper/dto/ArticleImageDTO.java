package me.shinsunyoung.springbootdeveloper.dto;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class ArticleImageDTO {
    private String uuid; // 변경된 파일 이름
    private String fileName; // 원본 파일 이름
    private int ord; // 이미지 순서
    private Long articleId;
}









