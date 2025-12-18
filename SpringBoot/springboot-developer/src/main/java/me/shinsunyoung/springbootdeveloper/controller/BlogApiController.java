package me.shinsunyoung.springbootdeveloper.controller;

import lombok.RequiredArgsConstructor;
import me.shinsunyoung.springbootdeveloper.domain.Article;
import me.shinsunyoung.springbootdeveloper.dto.AddArticleRequest;
import me.shinsunyoung.springbootdeveloper.service.BlogService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class BlogApiController {
    private final BlogService blogService;
    @PostMapping("/api/articles")
//  ResponseEntity<전송할데이터타입> : 응답에 여러가지 설정이 필요할 경우 사용하는 방식
    public ResponseEntity<Article> addArticle(
            // @RequestBody : post메서드로 받는 데이터의 경우 붙여야하는 어노테이션
            @RequestBody AddArticleRequest request){
        // 클라이언트에서 받은 DTO로 서비스를 실행
        Article savedArticle = blogService.save(request);
        // 저장된 Article데이터를 클라이언트로 전송
        return ResponseEntity
                .status(HttpStatus.CREATED)
                .body(savedArticle);
    }
}
