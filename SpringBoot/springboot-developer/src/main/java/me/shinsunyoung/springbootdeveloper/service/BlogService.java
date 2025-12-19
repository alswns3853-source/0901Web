package me.shinsunyoung.springbootdeveloper.service;

import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import me.shinsunyoung.springbootdeveloper.domain.Article;
import me.shinsunyoung.springbootdeveloper.dto.AddArticleRequest;
import me.shinsunyoung.springbootdeveloper.dto.UpdateArticleRequest;
import me.shinsunyoung.springbootdeveloper.repository.BlogRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BlogService {
    private final BlogRepository blogRepository;

    public Article save(AddArticleRequest request){
        // DTO를 Entity로 변경 후 저장
        return blogRepository.save(request.toEntity());
    }
    public List<Article> findAll(){
        return blogRepository.findAll();
    }
    public Article findById(long id){
        // findById의 반환값이 Optional<Article>로 되어있기 때문에
        // Article로 변환하려면 orElseThrow나 get을 사용하여 변환해야함
        return blogRepository.findById(id)
                // 조회와 동시에 예외처리를 함께 작성
                .orElseThrow(() -> new IllegalArgumentException("not found: " + id));
                //.get(); // 예외처리를 하지않고 데이터를 꺼내는 방식
    }
    public void delete(long id){
        blogRepository.deleteById(id);
    }
    @Transactional // 조회한 데이터를 변경하면 자동으로 update문이 실행됨
    public Article update(long id, UpdateArticleRequest request){
        // 변경할 데이터 조회
        Article article = blogRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("not found: " + id));
        // 데이터 수정하기
        article.update(request.getTitle(), request.getContent());

        return article;
    }
}
