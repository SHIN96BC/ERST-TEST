package com.example.solugate.mapper;

import com.example.solugate.domain.CustomerAlliance;
import com.example.solugate.domain.CustomerProduct;
import com.example.solugate.domain.InquiryProduct;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface CustomerCenterMapper {
    Long insertCustomerProduct(CustomerProduct customerProduct);
    Long insertInquiryProduct(Map<String, List<InquiryProduct>> insertInquiryMap);
    Long insertCustomerAlliance(CustomerAlliance customerAlliance);
}
