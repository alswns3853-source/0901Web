package me.shinsunyoung.springbootdeveloper.dto;

import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import me.shinsunyoung.springbootdeveloper.domain.Article;

@Data
public class ArticleListViewResponse {
    private final Long id;
    private final String title;
    private final String content;
    public ArticleListViewResponse(Article article){
        this.id = article.getId();
        this.title = article.getTitle();
        this.content = article.getContent();
    }
}
