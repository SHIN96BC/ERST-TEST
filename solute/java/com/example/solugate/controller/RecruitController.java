package com.example.solugate.controller;

import com.example.solugate.domain.PageForView;
import com.example.solugate.domain.RecruitForView;
import com.example.solugate.domain.RecruitListAndPage;
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
    public String recruitView(long id) {

        return "/recruit/recruit_recruit_view";
    }
}
