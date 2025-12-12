package org.zerock.springex.dto;


import lombok.Builder;
import lombok.Data;
import lombok.ToString;

import java.util.List;

@Data
@ToString
public class PageResponseDTO<E> {
    private int page; // 페이지 번호
    private int size; // 출력 데이터 개수
    private int total; // 총 개수
    private List<E> dtoList; // 출력 데이터 리스트
    private int start; // 시작번호
    private int end; // 끝번호
    private boolean prev; // 이전 페이지 존재 여부
    private boolean next; // 다음 페이지 존배 여부
    private int last; // 마지막 페이지 번호


    @Builder(builderMethodName = "withAll")
    public PageResponseDTO(PageRequestDTO pageRequestDTO,
                           List<E> dtoList,
                           int total){
        this.page = pageRequestDTO.getPage();
        this.size = pageRequestDTO.getSize();
        this.total = total;
        this.dtoList = dtoList;

        // 1 / 10 = > 0.1 올림 => 1 * 10 = 10
        // 5 / 10 = > 0.5 올림 => 1 * 10 = 10
        //11 / 10 = > 1.1 올림 => 2 * 10 = 20
        //29 / 10 = > 2.9 올림 => 3 * 10 = 30
        this.end = (int)(Math.ceil(this.page/10.0)*10); // 페이지 번호 끝값
        this.start = this.end - 9; // 페이지 번호 시작값
        this.last = (int)(Math.ceil((total/(double)size))); // 전체 페이지 끝값
        this.end = Math.min(end, last); // end값이 last보다 클 경우 last값을 end에 저장

        this.prev = this.start > 1; // 이전 페이지 버튼 여부
        this.next = total > this.end * this.size; // 다음 페이지 버튼 여부
    }
}
