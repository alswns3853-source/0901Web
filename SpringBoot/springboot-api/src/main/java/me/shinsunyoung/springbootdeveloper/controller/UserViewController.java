package me.shinsunyoung.springbootdeveloper.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserViewController {
    @GetMapping("/login")
    public String login(){
        return "login"; // 일반 로그인 페이지
//        return "oauthLogin"; // 소셜로그인페이지
    }
    @GetMapping("/signup")
    public String signup(){
        return "signup";
    }
}
