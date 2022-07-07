package com.example.solugate.solution.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/solution")
public class SolutionController {
    @GetMapping("sgacc")
    public String sgacc() {
        return "/solution/solutions_sgacc";
    }
    @GetMapping("sgsas")
    public String sgsas() {
        return "/solution/solutions_sgsas";
    }
}
