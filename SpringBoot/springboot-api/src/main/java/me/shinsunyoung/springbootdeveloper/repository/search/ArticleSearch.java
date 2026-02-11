package me.shinsunyoung.springbootdeveloper.repository.search;

import me.shinsunyoung.springbootdeveloper.domain.Article;
import me.shinsunyoung.springbootdeveloper.dto.ArticleListViewResponse;
import me.shinsunyoung.springbootdeveloper.dto.PageRequestDTO;
import me.shinsunyoung.springbootdeveloper.dto.PageResponseDTO;
import org.springframework.data.domain.Page;

public interface ArticleSearch {
    PageResponseDTO<ArticleListViewResponse> search(PageRequestDTO pageRequestDTO);
}
