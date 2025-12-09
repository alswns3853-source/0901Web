package org.zerock.springex.controller;

import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;


// 의존성 주입이 가능하도록 bean를 자동 생성하도록 설정하는 어노테이션
// @Controller : 요청을 처리하는 주소 설정이 가능해짐
@Controller
@Log4j2
public class SampleController {
// @GetMapping, @PostMapping은 Controller안에서 여러개 선언할 수 있음  
// 주소는 Get, Post처리당 하나씩만 사용할 수 있음. 중복되는 경우 에러가 발생
// doGet을 실행하는 것과 같은 효과를 가진 어노테이션
      @GetMapping("/hello")
      public void hello() {
          log.info("hello");
      }
// 위에서 GetMapping으로 /hello를 사용하기 떄문에 또 따른 GetMapping(/hello)를 사용할 수 없음
//    @GetMapping("/hello")
//    public void hello() {
//        log.info("hello");
//    }
// @PostMapping : doPost을 설정하는 것과 같도록 하는 어노테이션
    @PostMapping("/hello")
    public void helloPost(){
        log.info("helloPost");
    }

    @GetMapping("/ex1")
    // 매개변수에 파라미터 이름을 설정하면 자동을 파라미터를 읽고 매개변수에 파라미터를 저장
    public void ex1(String name, int age){
          log.info("name : " + name);
          log.info("age : " + age);
    }
    @GetMapping("/ex2")
    // 파라미터를 보내지 않는 경우 기본값을 설정하는 방식
    public void ex2(@RequestParam(name="name", defaultValue = "AAA") String name
            , @RequestParam(name="age", defaultValue = "30") int age){
        log.info("name : " + name);
        log.info("age : " + age);
    }
    @GetMapping("/ex3")
    // 매개변수에 파라미터 이름을 설정하면 자동을 파라미터를 읽고 매개변수에 파라미터를 저장
    public void ex3(LocalDate localDate){
        log.info("LocalDate : " + localDate);
    }
}
