package com.example.solugate.company.service;

import com.example.solugate.company.domain.CompanyInfo;
import com.example.solugate.company.domain.History;
import com.example.solugate.company.domain.HistoryForView;

import java.util.List;
import java.util.Map;

public interface CompanyService {
    List<CompanyInfo> findByCompanyInfoAll();
    Map<String, List<HistoryForView>> findByHistoryAll();
}
