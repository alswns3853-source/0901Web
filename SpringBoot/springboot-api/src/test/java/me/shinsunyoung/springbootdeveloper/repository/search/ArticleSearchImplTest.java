package me.shinsunyoung.springbootdeveloper.repository.search;

import me.shinsunyoung.springbootdeveloper.domain.Article;
import me.shinsunyoung.springbootdeveloper.dto.ArticleListViewResponse;
import me.shinsunyoung.springbootdeveloper.dto.PageRequestDTO;
import me.shinsunyoung.springbootdeveloper.dto.PageResponseDTO;
import me.shinsunyoung.springbootdeveloper.repository.BlogRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class ArticleSearchImplTest {
    @Autowired(required = false)
    BlogRepository blogRepository;
    @Test
    void search() {
        //of(페이지번호, 출력할 개수, 정렬방식);
        PageRequestDTO pageRequestDTO = PageRequestDTO.builder()
                .page(1)
                .size(10)
                .types("c")
                .keyword("테스트")
                .build();
        PageResponseDTO<ArticleListViewResponse> page =
                blogRepository.search(pageRequestDTO);
        System.out.println(page.getTotalPages()); // 총 페이지 수
        System.out.println(page.getTotalElements()); // 총 데이터 수
        System.out.println(page.getDtoList());
    }
}







