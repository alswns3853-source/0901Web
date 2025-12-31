package me.shinsunyoung.springbootdeveloper.controller;

import lombok.RequiredArgsConstructor;
import me.shinsunyoung.springbootdeveloper.domain.Article;
import me.shinsunyoung.springbootdeveloper.dto.ArticleListViewResponse;
import me.shinsunyoung.springbootdeveloper.dto.ArticleViewResponse;
import me.shinsunyoung.springbootdeveloper.dto.PageRequestDTO;
import me.shinsunyoung.springbootdeveloper.dto.PageResponseDTO;
import me.shinsunyoung.springbootdeveloper.service.BlogService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@RequiredArgsConstructor
@Controller
public class BlogViewController {
    private final BlogService blogService;
    @GetMapping("/")
    public String index(){
        return "redirect:/articles";
    }
    @GetMapping({"/articles"})
    public String getArticles(PageRequestDTO pageRequestDTO, Model model){
        PageResponseDTO<ArticleListViewResponse> articles =
                blogService.searchArticle(pageRequestDTO);
        model.addAttribute("articles", articles);
        return "articleList";
    }
    @GetMapping("/articles/{id}")
    public String findArticle(@PathVariable("id") long id,
                              PageRequestDTO pageRequestDTO,
                              Model model){
        Article article = blogService.findById(id);
        model.addAttribute("article", new ArticleViewResponse(article));
        return "article";
    }
    @GetMapping("/new-article")
    public String newArticle(@RequestParam(required = false) Long id,
                             PageRequestDTO pageRequestDTO,
                             Model model){
        if(id == null){
            // 글 추가
            model.addAttribute("article", new ArticleViewResponse());
        }else{
            // 글 수정
            Article article = blogService.findById(id);
            model.addAttribute("article", new ArticleViewResponse(article));
        }
        return "newArticle";
    }
}











