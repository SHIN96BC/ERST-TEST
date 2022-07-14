package com.example.solugate.service;

import com.example.solugate.domain.CompanyInfo;
import com.example.solugate.domain.History;

import java.util.List;
import java.util.Map;

public interface CompanyService {
    List<CompanyInfo> findByCompanyInfoAll();
    List<History> findByHistoryAll();
}
