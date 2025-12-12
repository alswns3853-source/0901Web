package org.zerock.springex.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.springex.dto.MemberDTO;
import org.zerock.springex.service.MemberService;

@Controller
@RequiredArgsConstructor
@Log4j2
@RequestMapping("/member")
public class MemberController {
    private final MemberService memberService;

    @GetMapping("/login")
    public String login(){
        return "member/login";
    }

    @PostMapping("/login")
    public String login(MemberDTO param, HttpSession session
        , HttpServletRequest request, HttpServletResponse response){
        MemberDTO loginData = memberService.login(param);
        if(loginData == null){
            return "redirect:/member/login?msg=error";
        }
        session.setAttribute("loginData", loginData);
        return "redirect:/todo/list";
    }
    @GetMapping("/logout")
    public String logout(HttpSession session){
        // loginData만 삭제
        session.removeAttribute("loginData");
        // 세션의 모든 데이터 삭제
        session.invalidate();
        return "redirect:/todo/list";
    }
    @GetMapping("/join")
    public String joinGet(){
        return "member/join";
    }
    @PostMapping("/join")
    public String joinPost(MemberDTO param){
        memberService.join(param);
        return "redirect:/member/login";
    }

}
