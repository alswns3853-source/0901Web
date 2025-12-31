package me.shinsunyoung.springbootdeveloper.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import me.shinsunyoung.springbootdeveloper.domain.Article;
import me.shinsunyoung.springbootdeveloper.domain.ArticleImage;

import java.util.Set;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
// Article을 추가할때 사용하는 DTO
public class AddArticleRequest {
    private String title;
    private String content;
    private String userId;
    // DTO를 Entity로 변경하는 메서드
    public Article toEntity(){
        return Article.builder()
                .title(this.title)
                .content(this.content)
                .userId(this.userId)
                .build();
    }
    public Article toEntityImage(Set<ArticleImage> images){
        return Article.builder()
                .title(this.title)
                .content(this.content)
                .userId(this.userId)
                .images(images)
                .build();
    }
}
