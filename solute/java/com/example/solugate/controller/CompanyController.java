package com.example.solugate.controller;

import com.example.solugate.domain.CompanyInfo;
import com.example.solugate.domain.History;
import com.example.solugate.service.CompanyService;
import com.example.solugate.service.CompanyServiceImpl;
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
        List<History> historyList = companyService.findByHistoryAll();
        return new ModelAndView("/company/company_history", "historyList", historyList);
    }
}
