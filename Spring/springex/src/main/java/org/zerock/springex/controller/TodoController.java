package org.zerock.springex.controller;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.springex.dto.PageRequestDTO;
import org.zerock.springex.dto.TodoDTO;
import org.zerock.springex.service.TodoService;

// RequestMapping에 공통 주소 설정
@Controller
@RequestMapping("/todo")
@Log4j2
@RequiredArgsConstructor
public class TodoController {
    private final TodoService service;

//    @GetMapping("/list")
//    public void list(Model model){
//  반환값을 void로 설정하는 경우 주소를 파일 이름으로 사용하여 jsp파일 실행
//  prefix + /list + suffix => /WEB-INF/views/todo/list.jsp 화면이 실행됨
//        log.info("GET Todo List.......");
//        model.addAttribute("dtoList", service.getAll());
//    }
@GetMapping("/list")
public void list(@Valid PageRequestDTO pageRequestDTO,
                 BindingResult bindingResult, Model model){
    log.info("GET Todo List.......");
    if(bindingResult.hasErrors()){
        // 화면에서 보낸 pageRequestDTO에 문제가 있을 경우
        // page, size만 설정한 pageRequestDTO를 새로 만들어서 검색
        pageRequestDTO = PageRequestDTO.builder().build();
    }
    // jsp에 전달할 데이터 저장
    model.addAttribute("responseDTO"
            , service.getList(pageRequestDTO));
}
    @GetMapping({"/read", "/edit"})
    public void read(PageRequestDTO pageRequestDTO,Long tno, Model model){
        TodoDTO dto = service.getById(tno);
        model.addAttribute("dto", dto);
    }

    @GetMapping("/register")
    public String registerGET(){
//  반환값이 String인 경우 직접 jsp파일을 설정하는 방식
        log.info("GET Todo Register........");
//  prefix + todo/register + suffix => /WEB-INF/views/todo/register.jsp 화면이 실행됨
        return "todo/register"; // void보단 String을 주로 사용함.
    }
    @PostMapping("/register")
    public String registerPOST(@Valid TodoDTO todoDTO,
                               // 파리미터 검증의 결과를 저장하는 매개변수
                               BindingResult bindingResult,
                               // 파라미터 검증에서 잘못된 부분이 있는 경우 돌려줄 데이터 설정
                               RedirectAttributes redirectAttributes){
//      객체 안에 있는 변수의 이름이 input태그에서 보내는 name과 일치하면
//      자동으로 데이터를 저장
        log.info("POST Todo Register........");
        log.info(todoDTO);
//      파라미터 검증에서 에러가 있는 경우
        if(bindingResult.hasErrors()){
            log.info("has errors..............");
//          list페이지에 오류 문구 전달
            redirectAttributes.addFlashAttribute("errors",
                    bindingResult.getAllErrors());
//            할일 등록 화면으로 리다이렉트
            return "redirect:/todo/register";
        }
//      DB에 데이터를 등록할 수 있도록 Service실행
        service.register(todoDTO);
        return "redirect:/todo/list";
    }


    @PostMapping("/edit")
    public String editPOST(TodoDTO dto){
        log.info("POST Todo Edit...........");
        service.edit(dto);
        return "redirect:/todo/read?tno="+dto.getTno();
    }
    @PostMapping("/remove")
    public String removePOST(Long tno){ 
        log.info("POST Todo Remove...........");
        service.remove(tno);
        return "redirect:/todo/list";
    }
}
