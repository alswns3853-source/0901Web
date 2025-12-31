package me.shinsunyoung.springbootdeveloper.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import me.shinsunyoung.springbootdeveloper.domain.Article;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@NoArgsConstructor
@Getter
public class ArticleViewResponse {
    private Long id;
    private String title;
    private String content;
    private String userId;
    private LocalDateTime createdAt;
    List<ArticleImageDTO> images;
    public ArticleViewResponse(Article article) {
        this.id = article.getId();
        this.title = article.getTitle();
        this.content = article.getContent();
        this.userId = article.getUserId();
        this.createdAt = article.getCreatedAt();
        // 이미지를 화면에서 사용가능한 데이터로 변환
        this.images = (article.getImages()==null || article.getImages().isEmpty())
                ?  new ArrayList<>() : article.getImages().stream().sorted()
                .map(image -> ArticleImageDTO.builder()
                        .uuid(image.getUuid())
                        .fileName(image.getFileName())
                        .ord(image.getOrd())
                        .articleId(article.getId())
                        .build())
                .collect(Collectors.toList());
    }
}
