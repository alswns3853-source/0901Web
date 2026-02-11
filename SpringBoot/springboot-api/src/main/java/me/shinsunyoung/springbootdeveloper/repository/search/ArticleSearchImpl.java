package me.shinsunyoung.springbootdeveloper.repository.search;

import com.querydsl.core.BooleanBuilder;
import com.querydsl.jpa.JPQLQuery;
import me.shinsunyoung.springbootdeveloper.domain.Article;
import me.shinsunyoung.springbootdeveloper.domain.QArticle;
import me.shinsunyoung.springbootdeveloper.dto.ArticleListViewResponse;
import me.shinsunyoung.springbootdeveloper.dto.PageRequestDTO;
import me.shinsunyoung.springbootdeveloper.dto.PageResponseDTO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.jaxb.SpringDataJaxb;
import org.springframework.data.jpa.repository.support.QuerydslRepositorySupport;

import java.util.List;
import java.util.stream.Collectors;

public class ArticleSearchImpl extends QuerydslRepositorySupport implements ArticleSearch {

    public ArticleSearchImpl() {
        super(Article.class);
    }

    @Override
    public PageResponseDTO<ArticleListViewResponse> search(PageRequestDTO pageRequestDTO) {
        QArticle qArticle = QArticle.article; // Q엔티티 객체 생성
        // Article의 기본적인 from절 생성
        JPQLQuery<Article> query = from(qArticle); // SELECT * FROM article
        // WHERE절 설정
        String[] types = pageRequestDTO.splitTypes();
        String keyword = pageRequestDTO.getKeyword();
//        isEmpty() : "" 문자열이 없을때만 true
//        isBlank() : "", "  " 문자열이 없거나 스페이스가 들어있을때 true
        if(types!=null && types.length>0 && keyword!=null &&!keyword.isBlank()){
            // AND,OR 기호를 붙여 WHERE을 만들어야하는 경우 사용
            BooleanBuilder builder = new BooleanBuilder();
            for(String type : types){
                switch(type){
                    case "t" -> {
                        // types에 t가 있는 경우 title로 검색조건 추가
                        builder.or(qArticle.title.contains(pageRequestDTO.getKeyword()));
                        // title LIKE '%keyword%'
                    }
                    case "c" -> {
                        // types에 c가 있는 경우 content로 검색조건 추가
                        builder.or(qArticle.content.contains(pageRequestDTO.getKeyword()));
                        // content LIKE '%keyword%'
                    }
                }
            }
            // 반복문이 끝나는 부분에 booleanBuilder설정
            query.where(builder); // booleanBuilder에 있는 조건문이 query에 설정됨
            // query.where은 AND조건으로 동작함
        }

        // pageable에 설정한 페이지번호,출력개수,정렬을 적용하여 query문을 변경
        this.getQuerydsl().applyPagination(pageRequestDTO.getPageable(), query);
        // sql실행 후 list에 저장
        List<Article> list = query.fetch();
        // sql 실행 결과의 개수 저장
        long count = query.fetchCount();
        // 무한 순환 참조를 막기 위해 DTO로 변경
        List<ArticleListViewResponse> articleList = list.stream()
                .map(ArticleListViewResponse::new)
                .collect(Collectors.toList());
        // Page객체 생성
        PageImpl<ArticleListViewResponse> page = new PageImpl<>(articleList, pageRequestDTO.getPageable(), count);
        // 화면에서 사용할 DTO 작성
        PageResponseDTO<ArticleListViewResponse> response =
                new PageResponseDTO<>(pageRequestDTO, page);
        return response;
    }
}
