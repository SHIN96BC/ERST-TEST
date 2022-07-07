package com.example.solugate.recruit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/recruit")
public class RecruitController {
    @GetMapping("list")
    public String recruitList() {
        return "/recruit/recruit_recruit_list";
    }

    @GetMapping("view")
    public String recruitView() {
        return "/recruit/recruit_recruit_view";
    }
}
