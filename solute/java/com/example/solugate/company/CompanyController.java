package com.example.solugate.company;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/company")
public class CompanyController {
    @GetMapping("ceo.do")
    public String ceo() {
        return "/company/company_ceo";
    }
}
