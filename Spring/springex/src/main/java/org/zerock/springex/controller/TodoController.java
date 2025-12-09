package org.zerock.springex.controller;


import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

// Controller에 공통 주소 설정
@Controller
@RequestMapping("/todo")
@Log4j2
public class TodoController {
    @GetMapping("/list")
    public void list(){
        // 반환값을 void로 설정하는 경우 주소를 파일 이름으로 사용하여 jsp파일 실행
        // prefix + /list + suffix => /WEB-INF/views/todo/list.jsp 화면이 실행됨
        log.info("GET Todo List.......");
    }
    @GetMapping("/register")
    public String registerGET(){
        // 반환값이 String인 경우 직접 jsp파일을 설정하는 방식
        log.info("GET Todo Register........");
        // prefix + add + suffix => /WEB-INF/views/add.jsp 화면이 실행됨
        return "add"; // void보단 String을 주로 사용함.
    }
    @PostMapping("/register")
    public void registerPost(){
        log.info("POST Todo Register........");
    }
    @GetMapping("/edit")
    public void editGET(){
        log.info("GET Todo Edit...........");
    }
    @PostMapping("/edit")
    public void editPOST(){
        log.info("POST Todo Edit...........");
    }
    @PostMapping("/remove")
    public void removePOST(){
        log.info("POST Todo Remove...........");
    }
}
