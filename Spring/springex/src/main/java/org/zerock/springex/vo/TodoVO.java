package org.zerock.springex.vo;

import lombok.*;

import java.time.LocalDate;

@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
// VO : DB에서 데이터를 꺼낼때 사용하는 객체
// 데이터를 꺼내는 용도로 사용하기 때문에 Setter를 구현하지 않음
// 테이블의 열과 변수가 1대1로 매칭되록 작성
public class TodoVO {
    private Long tno; // 기본키(PK)
    private String title; // 제목
    private String writer; // 작성자
    private boolean finished; // 완료여부
    private LocalDate dueDate; // 날짜
}
