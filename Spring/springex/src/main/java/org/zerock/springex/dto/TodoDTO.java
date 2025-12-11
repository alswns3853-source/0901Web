package org.zerock.springex.dto;

import jakarta.validation.constraints.Future;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Past;
import lombok.*;
import org.zerock.springex.vo.TodoVO;

import java.time.LocalDate;

@ToString // 모든 변수를 출력하는 toString 생성
// Getter,Setter,toString, RequiredArgsConstructor, EqualsAndHashCode를 한번에 설정
// @Data
@Builder // 객체를 생성하는 방식중에 하나
@AllArgsConstructor // 모든 변수를 설정하는 생성자
@NoArgsConstructor // 변수 설정이 없는 기본 생성자
// @RequiredArgsConstructor // 필수 변수만 설정하는 생성자
@Getter // 모든 변수의 Getter 생성
@Setter // 모든 변수의 Setter 생성
@EqualsAndHashCode // 기본키를 기준으로 equals, hashCode메서드를 생성
public class TodoDTO {
    private Long tno; // 기본키(PK)
//  @Size(min=1, max=10) : 문자 개수, 배열의 개수를 확인
//  @NotBlank : 빈문자열, null, 스페이스 등의 데이터가 들어있는지 확인
    @NotEmpty // 빈자열, null 확인
    private String title; // 제목
    @NotEmpty
    private String writer; // 작성자
    private boolean finished; // 완료여부
//  @Past : 과거 날짜인지 확인
    @Future // 미래 날짜인지 확인
    private LocalDate dueDate; // 날짜

    // VO를 DTO로 변환하는 생성자
    public TodoDTO(TodoVO vo){
        this.tno = vo.getTno();
        this.title = vo.getTitle();
        this.writer = vo.getWriter();
        this.finished = vo.isFinished();
        this.dueDate = vo.getDueDate();
    }
    // DTO를 VO로 변환하는 메서드
    public TodoVO convertVO(){
        return TodoVO.builder()
                .tno(this.tno)
                .title(this.title)
                .writer(this.writer)
                .finished(this.finished)
                .dueDate(this.dueDate)
                .build();
    }
}
