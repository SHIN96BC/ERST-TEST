package com.example.solugate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/error")
public class ErrorController {
    @GetMapping("null")
    public String nullError() {
        return "/error/null_error_page";
    }
}
