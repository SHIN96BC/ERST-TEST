package com.example.solugate.company.repository;

import com.example.solugate.company.domain.CompanyInfo;
import com.example.solugate.company.domain.History;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface CompanyRepository {
    List<CompanyInfo> selectCompanyInfoAll();
    List<History> selectHistoryAll();
}
