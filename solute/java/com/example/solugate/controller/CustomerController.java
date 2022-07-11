package com.example.solugate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/customer")
public class CustomerController {
    @GetMapping("customer_center")
    public String customer() {
        return "/customer/customercenter_inquiry";
    }
}
