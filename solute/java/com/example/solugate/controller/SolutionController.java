package com.example.solugate.controller;

import com.example.solugate.domain.Solution;
import com.example.solugate.domain.SolutionContentForView;
import com.example.solugate.service.SolutionService;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/solution")
public class SolutionController {
    Logger logger = LoggerFactory.getLogger(SolutionController.class);
    private final SolutionService solutionService;

    @PostMapping("menu")
    @ResponseBody
    public List<Solution> setMenu() {
        return solutionService.findBySolutionIdAndName();
    }

    @GetMapping("content")
    public ModelAndView sgacc(@RequestParam(value = "id") String idStr) {
        SolutionContentForView solutionContentForView = solutionService.findBySolutionContent(idStr);
        return new ModelAndView(
                "/solution/solutions_content", "solutionContentForView", solutionContentForView
        );
    }
}
