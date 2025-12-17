package org.zerock.company.controller;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.zerock.company.dto.MemberDTO;
import org.zerock.company.dto.PageRequestDTO;
import org.zerock.company.dto.TodoDTO;
import org.zerock.company.service.TodoService;

@Controller
@RequiredArgsConstructor
@Log4j2
@RequestMapping("/todo")
public class TodoController {

    private final TodoService service;


    @GetMapping("/list")
    public void list(@Valid PageRequestDTO pageRequestDTO,
                     BindingResult bindingResult,
                     Model model){
        log.info("GET Todo List....");
        if(bindingResult.hasErrors()){
            pageRequestDTO = PageRequestDTO.builder().build();
        }
        model.addAttribute("responseDTO", service.getList(pageRequestDTO));
    }

    @GetMapping({"/view", "/edit"})
    public void read(PageRequestDTO pageRequestDTO,
                     Long num,
                     Model model){
        TodoDTO dto = service.getById(num);
        service.editVisitCount(num);
        /*dto.setContent(dto.getContent().replaceAll("(\r\n|\n)", "<br/>"));*/
        model.addAttribute("dto", dto);
    }


    @PostMapping("/edit")
    public String editPOST(@Valid TodoDTO dto, BindingResult result){
        log.info("POST Todo Edit....");
        if(result.hasErrors()){
            return "todo/edit";
        }
        service.edit(dto);
        return "redirect:/todo/view?num=" + dto.getNum();
    }


    @PostMapping("/remove")
    public String removePOST(Long num){
        log.info("POST Todo Remove....");
        service.remove(num);
        return "redirect:/todo/list";
    }


    @GetMapping("/write")
    public void newForm(Model model){
        model.addAttribute("dto", new TodoDTO());
    }


    @PostMapping("/write")
    public String create(@Valid TodoDTO dto,
                         BindingResult result, HttpSession session){
        log.info("POST Todo Create....");
        MemberDTO loginData = (MemberDTO)session.getAttribute("loginData");
        dto.setId(loginData.getId());
        if(result.hasErrors()){
            return "todo/write";
        }
        service.register(dto);
        return "redirect:/todo/list";
    }
    @GetMapping("/about")
    public String about() {

        return "todo/about";
    }
    @GetMapping("/services")
    public String services() {
        return  "todo/services";
    }
    @GetMapping("/contact-us")
    public String contactUs(){
        return "todo/contact-us";
    }
    @GetMapping("/portfolio")
    public String portfolio(){
        return "todo/portfolio";
    }
}
