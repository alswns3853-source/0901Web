package me.shinsunyoung.springbootdeveloper.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import lombok.*;
import org.springframework.boot.context.properties.bind.DefaultValue;

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString(exclude = "article")
@Entity
public class ArticleImage implements Comparable<ArticleImage>{
    @Id
    private String uuid; // 변경된 파일 이름
    private String fileName; // 원본 파일 이름
    private int ord; // 이미지 순서
    // 연관 관계 설정
    @ManyToOne // 다대일 , N:1 : FK(외래키)를 가진 테이블 설정
    private Article article;

    @Override
    public int compareTo(ArticleImage o) {
//      order를 기준으로 오름차순 정렬 설정
        return this.ord - o.getOrd();
    }
}
