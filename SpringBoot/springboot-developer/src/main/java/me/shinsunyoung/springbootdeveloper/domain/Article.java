package me.shinsunyoung.springbootdeveloper.domain;

import jakarta.persistence.*;
import lombok.*;
import me.shinsunyoung.springbootdeveloper.util.FileNameUtil;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.time.LocalDateTime;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@EntityListeners(AuditingEntityListener.class)
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Builder
@Getter
@ToString(exclude="images") // images는 문자열로 변경시 제외
@Entity

public class Article {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id", updatable = false)
    private Long id;
    @Column(name="title", nullable = false)
    private String title;
    @Column(name="content", nullable = false)
    private String content;
    @Column(name="user_id")
    private String userId;

    @OneToMany(mappedBy = "article", // PK가 있는 곳, 관계의 설정
            cascade={CascadeType.ALL}, // PK삭제시 FK데이터를 모두 삭제하도록 설정
            fetch=FetchType.LAZY, // SQL실행시 모아서 한번에 실행하도록 설정(최적화)
            orphanRemoval=true)// Article에서 이미지를 삭제하면 실제로 삭제되도록 설정
    @Builder.Default
    private Set<ArticleImage> images = new HashSet<>();

    @CreatedDate
    @Column(name = "created_at")
    private LocalDateTime createdAt;
    @LastModifiedDate
    @Column(name = "updated_at")
    private LocalDateTime updatedAt;

    @Builder
    public Article(String title, String content, String userId){
        this.title = title;
        this.content = content;
        this.userId = userId;
    }
    // title,content변경하는 메서드
    public void update(String title, String content){
        this.title = title;
        this.content = content;
    }
    public void changeImage(List<FileNameUtil> fileList){
        // DB에 저장된 ord의 가장 큰 수를 저장
        int lastNum = images.stream()
                .map(ArticleImage::getOrd) // 각각의 ord데이터만 꺼내어 사용
                .max(Comparator.naturalOrder()) // ord데이터 중 가장 큰수를 찾기
                .orElse(0); // 에러가 있다면 0을 반환 없다면 가장 큰 수를 반환
        for(FileNameUtil file : fileList){
            lastNum++;
            ArticleImage articleImage = ArticleImage.builder()
                    .uuid(file.getNewFileName())
                    .fileName(file.getOriginalFileName())
                    .ord(lastNum)
                    .article(this) // article_id 열 저장
                    .build();
            // images에 새로운 파일을 저장
            images.add(articleImage);
        }
    }
}
