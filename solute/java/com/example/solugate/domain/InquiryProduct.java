package com.example.solugate.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class InquiryProduct {
    private long id;
    private String name;
    private long customerProductId;

    public InquiryProduct(long id, String name, long customerProductId) {
        this.id = id;
        this.name = name;
        this.customerProductId = customerProductId;
    }
}
