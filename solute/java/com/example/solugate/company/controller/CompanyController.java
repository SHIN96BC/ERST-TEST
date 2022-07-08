package com.example.solugate.company.controller;

import com.example.solugate.company.domain.CompanyInfo;
import com.example.solugate.company.domain.HistoryForView;
import com.example.solugate.company.service.CompanyService;
import com.example.solugate.company.service.CompanyServiceImpl;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;
import java.util.Set;

@Controller
@RequestMapping("/company")
@RequiredArgsConstructor
public class CompanyController {
    Logger logger = LoggerFactory.getLogger(CompanyServiceImpl.class);
    private final CompanyService companyService;

    @GetMapping("ceo")
    public ModelAndView ceo() {
        List<CompanyInfo> companyInfoList = companyService.findByCompanyInfoAll();
        return new ModelAndView("/company/company_ceo", "companyInfoList", companyInfoList);
    }

    @GetMapping("contactus")
    public ModelAndView contactus() {
        List<CompanyInfo> companyInfoList = companyService.findByCompanyInfoAll();
        return new ModelAndView("/company/company_contactus", "companyInfoList", companyInfoList);
    }

    @GetMapping("history")
    public ModelAndView history() {
        Map<String, List<HistoryForView>> resultMap = companyService.findByHistoryAll();

        List<HistoryForView> leftOddList = null;
        List<HistoryForView> rightEvenList = null;

        Set<String> keys = resultMap.keySet();
        for(String key: keys) {
            if(key.equals("left")) {
                leftOddList = resultMap.get(key);
            }else {
                rightEvenList = resultMap.get(key);
            }
        }

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/company/company_history");
        modelAndView.addObject("leftOddList", leftOddList);
        modelAndView.addObject("rightEvenList", rightEvenList);

        return modelAndView;
    }
}
