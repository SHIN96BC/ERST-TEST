package com.example.solugate.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
public class CustomerProduct {
    private long id;
    private String companyName;
    private String customerName;
    private String phone;
    private String email;
    private String inquiryContent;
    private List<String> inquiryProductNameList;

    public CustomerProduct(long id, String companyName, String customerName, String phone, String email, String inquiryContent, List<String> inquiryProductNameList) {
        this.id = id;
        this.companyName = companyName;
        this.customerName = customerName;
        this.phone = phone;
        this.email = email;
        this.inquiryContent = inquiryContent;
        this.inquiryProductNameList = inquiryProductNameList;
    }
}
