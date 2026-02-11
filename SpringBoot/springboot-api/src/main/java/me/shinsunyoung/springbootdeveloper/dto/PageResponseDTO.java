package me.shinsunyoung.springbootdeveloper.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.springframework.data.domain.Page;

import java.util.List;

@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class PageResponseDTO<T> {
    private PageRequestDTO pageRequestDTO;
    private int totalPages;
    private long totalElements;
    private List<T> dtoList;

    private int page; // 현재 페이지
    private int size; // 출력 개수
    private int start; // 번호 시작값
    private int end; // 번호 끝값
    private boolean prev; // 이전버튼 여부
    private boolean next; // 다음버튼 여부

    public PageResponseDTO(PageRequestDTO pageRequestDTO, Page<T> page){
        this.pageRequestDTO = pageRequestDTO;
        this.totalPages = page.getTotalPages();
        this.totalElements = page.getTotalElements();
        this.dtoList = page.getContent();
        this.page = pageRequestDTO.getPage();
        this.size = pageRequestDTO.getSize();

        this.end = (int)(Math.ceil(this.page/10.0)*10);
        this.start = this.end - 9;
        this.end = Math.min(this.end, this.totalPages);
        this.prev = this.start > 1;
        this.next = totalElements > (long) this.end * this.size;
    }
}
