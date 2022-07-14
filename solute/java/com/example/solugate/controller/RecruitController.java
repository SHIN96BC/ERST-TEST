package com.example.solugate.controller;

import com.example.solugate.constant.SessionConstant;
import com.example.solugate.domain.*;
import com.example.solugate.service.RecruitService;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/recruit")
public class RecruitController {
    Logger logger = LoggerFactory.getLogger(RecruitController.class);
    private final RecruitService recruitService;

    @GetMapping("list")
    public ModelAndView recruitList(HttpServletRequest request,
                                    @RequestParam(value = "cp", required = false, defaultValue = "0") String nowPageStr,
                                    @RequestParam(value = "ps", required = false, defaultValue = "0") String onePageCountStr,
                                    @RequestParam(value = "id", required = false, defaultValue = "0") String lastIdStr) {

        RecruitListAndPage recruitListAndPage = recruitService.setOnePage(nowPageStr, onePageCountStr, lastIdStr);
        List<RecruitForView> recruitForViewList = recruitListAndPage.getRecruitForViewList();
        PageForView pageForView = recruitListAndPage.getPageForView();

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/recruit/recruit_recruit_list");
        modelAndView.addObject("recruitForViewList", recruitForViewList);
        modelAndView.addObject("pageForView", pageForView);

        // 세션에 현재 페이지의 상태를 저장합니다.
        HttpSession session = request.getSession();
        if(!session.getAttribute(SessionConstant.RECRUIT_PAGE_STATE).equals(SessionConstant.RECRUIT_PAGE_LIST)) {
            session.setAttribute(SessionConstant.RECRUIT_PAGE_STATE, SessionConstant.RECRUIT_PAGE_LIST);
        }

        return modelAndView;
    }

    @GetMapping("view")
    public ModelAndView recruitView(@RequestParam(value = "id") String idStr) {
        RecruitContentForView recruitContentForView = recruitService.findByRecruitContent(idStr);
        // recruitContentForView 가 null 이면 에러창으로
        if (recruitContentForView == null){
            return new ModelAndView("redirect:/error/null");
        }

        return new ModelAndView(
                "/recruit/recruit_recruit_view",
                "recruitContentForView",
                recruitContentForView
        );
    }

    @PostMapping("search_support")
    @ResponseBody
    public List<Recruit> searchSupport() {
        return null;
    }

    @PostMapping("search_content")
    public ModelAndView searchContent(HttpServletRequest request) {

        // 세션에 현재 페이지의 상태를 저장합니다.
        HttpSession session = request.getSession();
        if(!session.getAttribute(SessionConstant.RECRUIT_PAGE_STATE).equals(SessionConstant.RECRUIT_PAGE_SEARCH)) {
            session.setAttribute(SessionConstant.RECRUIT_PAGE_STATE, SessionConstant.RECRUIT_PAGE_SEARCH);
        }
        return null;
    }
}
