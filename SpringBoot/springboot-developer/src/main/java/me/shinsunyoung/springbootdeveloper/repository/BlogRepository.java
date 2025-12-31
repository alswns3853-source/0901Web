package me.shinsunyoung.springbootdeveloper.repository;

import me.shinsunyoung.springbootdeveloper.domain.Article;
import me.shinsunyoung.springbootdeveloper.repository.search.ArticleSearch;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BlogRepository extends JpaRepository<Article,Long>, ArticleSearch {
    List<Article> findByTitleContains(String title);
    @Query("SELECT a FROM Article a WHERE a.title = ?1")
    List<Article> getArticles(String title);
}
