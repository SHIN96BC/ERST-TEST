package com.example.solugate.controller;

import com.example.solugate.domain.CustomerAlliance;
import com.example.solugate.domain.CustomerProduct;
import com.example.solugate.service.CustomerCenterService;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequiredArgsConstructor
@RequestMapping("/customer")
public class CustomerController {
    Logger logger = LoggerFactory.getLogger(CustomerController.class);

    private final CustomerCenterService customerCenterService;

    @GetMapping("customer_center")
    public String customer() {
        return "/customer/customercenter_inquiry";
    }

    @PostMapping("product_apply")
    @ResponseBody
    public boolean productApply(CustomerProduct customerProduct) {

        boolean flag = false;
        try {
            flag = customerCenterService.saveCustomerProduct(customerProduct);
        }catch(Exception e) {
        }
        return flag;
    }

    @PostMapping("alliance_apply")
    @ResponseBody
    public boolean allianceApply(CustomerAlliance customerAlliance) {

        boolean flag = false;
        try {
            flag = customerCenterService.saveCustomerAlliance(customerAlliance);
        }catch(Exception e) {
            logger.info("exception = " + e);
        }
        return flag;
    }
}
