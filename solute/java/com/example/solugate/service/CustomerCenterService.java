package com.example.solugate.service;

import com.example.solugate.domain.CustomerAlliance;
import com.example.solugate.domain.CustomerProduct;

public interface CustomerCenterService {
    boolean saveCustomerProduct(CustomerProduct customerProduct) throws Exception;
    boolean saveCustomerAlliance(CustomerAlliance customerAlliance) throws Exception;
}
