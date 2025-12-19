package me.shinsunyoung.springbootdeveloper.controller;

import lombok.RequiredArgsConstructor;
import me.shinsunyoung.springbootdeveloper.domain.Article;
import me.shinsunyoung.springbootdeveloper.dto.AddArticleRequest;
import me.shinsunyoung.springbootdeveloper.dto.ArticleResponse;
import me.shinsunyoung.springbootdeveloper.dto.UpdateArticleRequest;
import me.shinsunyoung.springbootdeveloper.service.BlogService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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
    @GetMapping("/api/articles")
    public ResponseEntity<List<ArticleResponse>> findAllArticles(){
        List<ArticleResponse> articles = blogService.findAll()
                .stream() // 한건한건 반복하여 dto로 변경
               // .map(article -> new ArticleResponse(article)) //
                .map(ArticleResponse::new) // 참조 표현식
                .toList();
        return ResponseEntity.ok()
                .body(articles);
    }
    @GetMapping("/api/articles/{id}")

    public ResponseEntity<ArticleResponse> findArticle
            // 주소창에 {id}에 들어있는 데이터를 @PathVariable에 저장
            (@PathVariable("id") long id){
        Article article = blogService.findById(id);

        return  ResponseEntity.ok()
                .body(new ArticleResponse(article));
    }
    @DeleteMapping("/api/articles/{id}")
    public ResponseEntity<Void> deleteArticle
            (@PathVariable("id") long id){
        blogService.delete(id);
        return ResponseEntity.ok().build();
    }
    @PutMapping("/api/articles/{id}")
    public ResponseEntity<Article> updateArticle(@PathVariable("id") long id,
                                                 @RequestBody UpdateArticleRequest request){
        // PK는 주소창에서 변경할 데이터는 파라미터로 받아옴
        Article updatedArticle = blogService.update(id, request);

        return  ResponseEntity.ok()
                .body(updatedArticle);
    }
}
