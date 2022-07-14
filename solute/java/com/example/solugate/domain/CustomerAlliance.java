package com.example.solugate.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class CustomerAlliance {
    private long id;
    private String companyName;
    private String customerName;
    private String phone;
    private String email;
    private String inquiryContent;

    public CustomerAlliance(long id, String companyName, String customerName, String phone, String email, String inquiryContent) {
        this.id = id;
        this.companyName = companyName;
        this.customerName = customerName;
        this.phone = phone;
        this.email = email;
        this.inquiryContent = inquiryContent;
    }
}
