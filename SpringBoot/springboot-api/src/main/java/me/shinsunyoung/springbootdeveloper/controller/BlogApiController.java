package me.shinsunyoung.springbootdeveloper.controller;

import lombok.RequiredArgsConstructor;
import me.shinsunyoung.springbootdeveloper.domain.Article;
import me.shinsunyoung.springbootdeveloper.domain.User;
import me.shinsunyoung.springbootdeveloper.dto.*;
import me.shinsunyoung.springbootdeveloper.service.BlogService;
import me.shinsunyoung.springbootdeveloper.util.FileNameUtil;
import me.shinsunyoung.springbootdeveloper.util.FileUtil;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class BlogApiController {
    private final BlogService blogService;
    private final FileUtil fileUtil;
    @PostMapping("/api/articles")
//  ResponseEntity<전송할데이터타입> : 응답에 여러가지 설정이 필요할 경우 사용하는 방식
    public ResponseEntity<Article> addArticle(
            // @RequestBody : post메서드로 받는 데이터의 경우 붙여야하는 어노테이션
            @RequestBody AddArticleRequest request,
//            @ModelAttribute UploadFileDTO files,
            // @AuthenticationPrincipal : 로그인시 저장한 SpringSecurity 데이터
            @AuthenticationPrincipal UserSecurityDTO user){
        // SpringSecurity 로그인 객체에서 사용자 ID를 꺼내어 저장
        request.setUserId(user.getUsername());
        List<FileNameUtil> fileList = null;
//        if(files!=null && files.getFiles()!=null){
//            fileList = fileUtil.uploadFile(files);
//        }
        // 클라이언트에서 받은 DTO로 서비스를 실행
        Article savedArticle = blogService.save(request, user.getUsername(), fileList);
        // 저장된 Article데이터를 클라이언트로 전송
        return ResponseEntity
                .status(HttpStatus.CREATED)
                .body(savedArticle);
    }
    @GetMapping("/api/articles")
    public ResponseEntity<List<ArticleResponse>> findAllArticles(){
        List<ArticleResponse> articles = blogService.findAll()
                .stream() // 한건한건 반복하여 dto로 변경
                //.map(article -> new ArticleResponse(article)) // 람다식
                .map(ArticleResponse::new) // 참조 표현식
                .toList();
        return ResponseEntity.ok().body(articles);
    }
    @GetMapping("/api/articles/{id}")
    public ResponseEntity<ArticleResponse> findArticle(
            // 주소창에 {id}에 들어있는 데이터를 @PathVariable에 저장
            @PathVariable("id") long id){
        Article article = blogService.findById(id);
        return ResponseEntity.ok().body(new ArticleResponse(article));
    }
    @DeleteMapping("/api/articles/{id}")
    public ResponseEntity<Void> deleteArticle(@PathVariable("id") long id){
        blogService.delete(id);
        return ResponseEntity.ok().build();
    }
    @PutMapping("/api/articles/{id}")
    public ResponseEntity<Article> updateArticle(
            @PathVariable("id") long id,
            @ModelAttribute UpdateArticleRequest request){
        UploadFileDTO fileDTO = new UploadFileDTO();
        fileDTO.setFiles(request.getFiles());
        List<FileNameUtil> fileList = fileUtil.uploadFile(fileDTO);
        // PK는 주소창에서 변경할 데이터는 파라미터로 받아옴
        Article updatedArticle = blogService.update(id, request,fileList);
        return ResponseEntity.ok()
                .body(updatedArticle);
    }
    @DeleteMapping("/api/img/{id}")
    public ResponseEntity<Void> deleteImage(
            @PathVariable String id
            ,@RequestBody ArticleImageDTO dto){
        // 이미지 파일 삭제
        boolean removed = fileUtil.fileRemove(dto.getUuid());
        // 파일이 정상적으로 삭제됐는지 확인
        if(removed){
            // 테이블에 있는 이미지 데이터 삭제
            blogService.removeImage(dto.getUuid());
        }
        return ResponseEntity.ok().build();
    }
}
