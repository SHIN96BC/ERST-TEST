package com.example.solugate.service;

import com.example.solugate.domain.CompanyInfo;
import com.example.solugate.domain.HistoryForView;

import java.util.List;
import java.util.Map;

public interface CompanyService {
    List<CompanyInfo> findByCompanyInfoAll();
    Map<String, List<HistoryForView>> findByHistoryAll();
}
