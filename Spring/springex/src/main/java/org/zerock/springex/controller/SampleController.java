package org.zerock.springex.controller;


import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDate;

// 의존성 주입이 가능하도록 bean을 자동 생성하도록 설정하는 어노테이션
// @Controller : 요청을 처리하는 주소 설정이 가능해짐
@Controller
@Log4j2
public class SampleController {
//  @GetMapping, @PostMapping은 Controller안에서 여러개 선언할 수 있음
//  주소는 Get,Post처리당 하나씩만 사용할 수 있음. 중복되는 경우 에러가 발생
//  doGet을 설정하는 것과 같은 효과를 가진 어노테이션
    @GetMapping("/hello")
    public void hello(){
        log.info("hello");
    }
//    위에서 GetMapping으로 /hello를 사용하기 때문에 또 다른 GetMapping(/hello)를 사용할 수 없음
//    @GetMapping("/hello")
//    public void hello2(){
//        log.info("hello");
//    }
//  @PostMapping : doPost을 설정하는 것과 같도록 하는 어노테이션
    @PostMapping("/hello")
    public void helloPost(){
        log.info("helloPost");
    }

    @GetMapping("/ex1")
//  매개변수에 파리미터 이름을 설정하면 자동으로 파라미터를 읽고 매개변수에 파라미터를 저장
    public void ex1(String name, int age){
        log.info("name : " + name);
        log.info("age : " + age);
    }
    @GetMapping("/ex2")
//  파라미터를 보내지 않는 경우 기본값을 설정하는 방식
    public void ex2(@RequestParam(name="name", defaultValue = "AAA") String name
            ,@RequestParam(name="age", defaultValue = "30") int age){
        log.info("name : " + name);
        log.info("age : " + age);
    }
    @GetMapping("/ex3")
    public void ex3(LocalDate localDate){
        log.info("LocalDate : " + localDate);
    }
    @GetMapping("/ex4")
    public void ex4(Model model){
        log.info("ex4 model test ........");
        String message = "화면으로 데이터를 전달하는 메시지";
        model.addAttribute("message", message);
    }
    @GetMapping("/ex5")
    public String ex5(RedirectAttributes redirectAttributes){
        log.info("ex5 redirect test ........");
//      파라미터를 전달할때 사용
        redirectAttributes.addAttribute("name", "hong");
//      일회용 데이터 전달시 사용
        redirectAttributes.addFlashAttribute("age", "20");
//      리다이렉트 방법 : return 부분에 redirect:실행할 주소
        return "redirect:/ex6";
    }
    @GetMapping("/ex6")
    public void ex6(String name){
        log.info("name : " + name);
    }
    @GetMapping("/ex7")
    public void ex7(String p1, int p2){
        log.info("p1 : " + p1);
        log.info("p2 : " + p2);
    }
}
