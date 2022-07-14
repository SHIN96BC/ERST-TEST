package com.example.solugate.service;

import com.example.solugate.domain.CustomerAlliance;
import com.example.solugate.domain.CustomerProduct;
import com.example.solugate.domain.InquiryProduct;
import com.example.solugate.mapper.CustomerCenterMapper;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class CustomerCenterServiceImpl implements CustomerCenterService{
    Logger logger = LoggerFactory.getLogger(CustomerCenterServiceImpl.class);
    private final CustomerCenterMapper customerCenterMapper;

    @Override
    @Transactional(rollbackFor = {Exception.class})
    public boolean saveCustomerProduct(CustomerProduct customerProduct) throws Exception{

        // AUTO_INCREMENT 를 사용할 때 rollback 하게되면 AUTO_INCREMENT 로 한번 올라간 값은 초기화되지 않습니다.
        if(customerProduct.getCompanyName() == null || customerProduct.getCustomerName() == null ||
                customerProduct.getPhone() == null || customerProduct.getEmail() == null ||
                customerProduct.getInquiryContent() == null || customerProduct.getInquiryProductNameList() == null)
            throw new Exception("null Error");

        if(customerProduct.getCompanyName().trim().length() < 1 || customerProduct.getCustomerName().trim().length() < 1 ||
                customerProduct.getPhone().trim().length() < 1 || customerProduct.getEmail().trim().length() < 1 ||
                customerProduct.getInquiryContent().trim().length() < 1 || customerProduct.getInquiryProductNameList().size() < 1)
            throw new Exception("empty Error");

        Long customerProductId = customerCenterMapper.insertCustomerProduct(customerProduct);
        if(customerProductId == null)
            throw new Exception("insertCustomerProduct Error");


        List<String> inquiryProductNameList = customerProduct.getInquiryProductNameList();
        List<InquiryProduct> inquiryProductList = new ArrayList<>();
        for(String inquiryProductName: inquiryProductNameList) {
            inquiryProductList.add(new InquiryProduct(-1L, inquiryProductName, customerProductId));
        }

        Map<String, List<InquiryProduct>> insertInquiryMap = new HashMap<>();
        insertInquiryMap.put("inquiryProductList", inquiryProductList);
        int insertInquiryCount = 0;
        insertInquiryCount += customerCenterMapper.insertInquiryProduct(insertInquiryMap);

        if(insertInquiryCount == inquiryProductList.size())
            return true;
        else
            throw new Exception("insertInquiryProduct Error");

    }

    @Override
    @Transactional(rollbackFor = {Exception.class})
    public boolean saveCustomerAlliance(CustomerAlliance customerAlliance) throws Exception{
        // AUTO_INCREMENT 를 사용할 때 rollback 하게되면 AUTO_INCREMENT 로 한번 올라간 값은 초기화되지 않습니다.
        if(customerAlliance.getCompanyName() == null || customerAlliance.getCustomerName() == null ||
                customerAlliance.getPhone() == null || customerAlliance.getEmail() == null ||
                customerAlliance.getInquiryContent() == null)
            throw new Exception("null Error");

        if(customerAlliance.getCompanyName().trim().length() < 1 || customerAlliance.getCustomerName().trim().length() < 1 ||
                customerAlliance.getPhone().trim().length() < 1 || customerAlliance.getEmail().trim().length() < 1 ||
                customerAlliance.getInquiryContent().trim().length() < 1)
            throw new Exception("empty Error");

        Long customerProductId = customerCenterMapper.insertCustomerAlliance(customerAlliance);
        if(customerProductId == null)
            throw new Exception("insertCustomerProduct Error");

        return true;
    }
}
