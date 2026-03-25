package com.project.instagramclone.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
@RequiredArgsConstructor
public class ViewController {
    // 민수가 회원가입 맡아서 매번 회원가입사이트 들어가서  개발 너무 귀찮다...
    // 본인이 하는 회원가입 페이지를 / 임시로 변경하고 해야징~!
    @GetMapping("/")
    public String indexView() {
        return "minsu_index";
    }
    @GetMapping("/user/login")
    public String loginView() {
        return "user/login";
    }

    @GetMapping("/user/register")
    public String registerView() {
        return "user/register";
    }

    @GetMapping("/user/mypage")
    public String myPageView(){
        return "user/mypage";
    }

    @GetMapping("/board/list")
    public String listView(Model model) {
        return "board/list";
    }

    @GetMapping("/board/detail" )
    public String detailView(int board_no, Model model) {
        return  "board/detail";
    }

    @GetMapping("/board/write")
    public String writeView() {
        return "board/write";
    }

    @GetMapping("/board/edit" )
    public String editView(int board_no, Model model) {
        return "board/edit";
    }
}