package me.shinsunyoung.springbootdeveloper.controller;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.time.LocalDate;
import java.util.List;

@Controller
public class ExampleController {
    @GetMapping("/thymeleaf/example")
    public String thymeleafExample(Model model){
        Person examplePerson = new Person();
        examplePerson.setId(1L); // PK
        examplePerson.setName("홍길동"); //이름
        examplePerson.setAge(11); //나이
        examplePerson.setHobbies(List.of("운동", "독서")); // 취미
        model.addAttribute("person", examplePerson); // 객체데이터
        model.addAttribute("today", LocalDate.now()); // 현재시간
        return "example";
    }
}
@Setter
@Getter
class Person{
    private Long id;
    private String name;
    private int age;
    private List<String> hobbies;
}
