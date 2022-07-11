package com.example.solugate.controller;

import com.example.solugate.domain.Recruit;
import com.example.solugate.domain.RecruitForView;
import com.example.solugate.domain.SetPage;
import com.example.solugate.service.RecruitService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/recruit")
public class RecruitController {
    private final RecruitService recruitService;

    @RequestMapping("list")
    public ModelAndView recruitList(@RequestParam(value = "cp", required = false, defaultValue = "0") int nowPage,
                                    @RequestParam(value = "ps", required = false, defaultValue = "0") int onePageCount) {

        List<RecruitForView> recruitsList = recruitService.setOnePage(nowPage, onePageCount);
        return new ModelAndView("/recruit/recruit_recruit_list", "recruitsList", recruitsList);
    }

    @GetMapping("view")
    public String recruitView() {
        return "/recruit/recruit_recruit_view";
    }
}
