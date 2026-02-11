package me.shinsunyoung.springbootdeveloper.dto;

import lombok.Getter;
import me.shinsunyoung.springbootdeveloper.domain.Article;

@Getter
public class ArticleResponse {
    private final String title;
    private final String content;
    private final String userId;
    public ArticleResponse(Article article){
        this.title = article.getTitle();
        this.content = article.getContent();
        this.userId = article.getUserId();
    }
}
