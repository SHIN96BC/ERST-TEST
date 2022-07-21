package com.example.solugate.controller;

import com.example.solugate.domain.*;
import com.example.solugate.service.RecruitService;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/recruit")
public class RecruitController {
    Logger logger = LoggerFactory.getLogger(RecruitController.class);
    private final RecruitService recruitService;

    @GetMapping("list")
    public ModelAndView recruitList(String keyword,
                                    @RequestParam(value = "cp", required = false, defaultValue = "0") String nowPageStr,
                                    @RequestParam(value = "ps", required = false, defaultValue = "0") String onePageCountStr) {

        RecruitListAndPage recruitListAndPage = recruitService.setOnePage(nowPageStr, onePageCountStr, keyword);
        List<RecruitForView> recruitForViewList = recruitListAndPage.getRecruitForViewList();
        PageForView pageForView = recruitListAndPage.getPageForView();

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/recruit/recruit_recruit_list");
        modelAndView.addObject("recruitForViewList", recruitForViewList);
        modelAndView.addObject("pageForView", pageForView);

        return modelAndView;
    }

    @GetMapping("view")
    public ModelAndView recruitView(@RequestParam(value = "id") String idStr,
                                    String keyword,
                                    @RequestParam(value = "cp", required = false, defaultValue = "0") String nowPageStr,
                                    @RequestParam(value = "ps", required = false, defaultValue = "0") String onePageCountStr) {

        RecruitContentForView recruitContentForView = recruitService.findByRecruitContent(idStr, nowPageStr, onePageCountStr, keyword);
        // recruitContentForView 가 null 이면 에러창으로
        if (recruitContentForView == null)
            return new ModelAndView("redirect:/error/null");


        return new ModelAndView(
                "/recruit/recruit_recruit_view",
                "recruitContentForView",
                recruitContentForView
        );
    }

    @PostMapping("search_support")
    @ResponseBody
    public List<String> searchSupport(String keyword) {
        return recruitService.setSearchSupport(keyword);
    }
}
