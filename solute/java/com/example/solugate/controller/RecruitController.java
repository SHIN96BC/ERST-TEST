package com.example.solugate.controller;

import com.example.solugate.domain.PageForView;
import com.example.solugate.domain.RecruitContentForView;
import com.example.solugate.domain.RecruitForView;
import com.example.solugate.domain.RecruitListAndPage;
import com.example.solugate.service.RecruitService;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
    Logger logger = LoggerFactory.getLogger(RecruitController.class);
    private final RecruitService recruitService;

    @GetMapping("list")
    public ModelAndView recruitList(@RequestParam(value = "cp", required = false, defaultValue = "0") String nowPageStr,
                                    @RequestParam(value = "ps", required = false, defaultValue = "0") String onePageCountStr,
                                    @RequestParam(value = "id", required = false, defaultValue = "0") String lastIdStr) {

        RecruitListAndPage recruitListAndPage = recruitService.setOnePage(nowPageStr, onePageCountStr, lastIdStr);
        List<RecruitForView> recruitForViewList = recruitListAndPage.getRecruitForViewList();
        PageForView pageForView = recruitListAndPage.getPageForView();

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/recruit/recruit_recruit_list");
        modelAndView.addObject("recruitForViewList", recruitForViewList);
        modelAndView.addObject("pageForView", pageForView);
        return modelAndView;
    }

    @GetMapping("view")
    public ModelAndView recruitView(@RequestParam(value = "id") String idStr) {
        RecruitContentForView recruitContentForView = recruitService.findByRecruitContent(idStr);
        // recruitContentForView 가 null 이면 에러창으로
        if (recruitContentForView == null){}

        return new ModelAndView(
                "/recruit/recruit_recruit_view",
                "recruitContentForView",
                recruitContentForView
        );
    }
}
