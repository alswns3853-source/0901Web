package me.shinsunyoung.springbootdeveloper.service;

import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import me.shinsunyoung.springbootdeveloper.domain.Article;
import me.shinsunyoung.springbootdeveloper.domain.ArticleImage;
import me.shinsunyoung.springbootdeveloper.dto.*;
import me.shinsunyoung.springbootdeveloper.repository.ArticleImageRepository;
import me.shinsunyoung.springbootdeveloper.repository.BlogRepository;
import me.shinsunyoung.springbootdeveloper.util.FileNameUtil;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
public class BlogService {
    private final BlogRepository blogRepository;
    private final ArticleImageRepository articleImageRepository;
    @Transactional
    public Article save(AddArticleRequest request, List<FileNameUtil> imageList){
        // 기사 데이터 생성
        Article article = request.toEntity();
        // 저장할 이미지가 있는지 확인
        if(imageList != null && !imageList.isEmpty()) {
            int count = 0; // 이미지 순서를 위한 숫자 변수
            for (FileNameUtil image : imageList) {
                ArticleImage data = ArticleImage.builder()
                        .uuid(image.getNewFileName()) // 이미지 uuid
                        .fileName(image.getOriginalFileName())// 원본 이름
                        .ord(count) // 이미지 순서
                        .article(article) // 기사와 이미지의 관계 설정, article_id
                        .build();
                // article의 images에 데이터를 저장
                article.getImages().add(data);
                count++;
            }
        }
        // article과 image 함께 저장
        return blogRepository.save(article);
    }

    public List<Article> findAll(){
        // Article 테이블의 전체 데이터 조회
        return blogRepository.findAll();
    }
    public PageResponseDTO<ArticleListViewResponse> searchArticle(PageRequestDTO pageRequestDTO){
        return blogRepository.search(pageRequestDTO);
    }

    public Article findById(long id){
        // findById의 반환값이 Optional<Article>로 되어있기 때문에
        // Article로 변환하려면 orElseThrow나 get을 사용하여 변환해야함
        return blogRepository.findById(id)
                // 조회와 동시에 예외처리를 함께 작성
                .orElseThrow(()->new IllegalArgumentException("not found: "+id));
                //.get(); //예외처리를 하지않고 데이터를 꺼내는 방
    }
    public void delete(long id){
        // 데이터 삭제
        blogRepository.deleteById(id);
    }
    @Transactional // 조회한 데이터를 변경하면 자동으로 update문이 실행됨
    public Article update(long id, UpdateArticleRequest request, List<FileNameUtil> fileList){
        // 변경할 데이터 조회
        Article article = blogRepository.findById(id)
                .orElseThrow(()->new IllegalArgumentException("not found: "+id));
        // 데이터 수정하기
        article.update(request.getTitle(), request.getContent());
        // 이미지 테이블에 추가
        article.changeImage(fileList);
        return article;
    }
    // 테이블에서 이미지를 삭제하는 메서드
    public void removeImage(String uuid){
        articleImageRepository.deleteById(uuid);
    }
}
