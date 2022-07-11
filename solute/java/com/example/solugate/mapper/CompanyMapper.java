package com.example.solugate.mapper;

import com.example.solugate.domain.CompanyInfo;
import com.example.solugate.domain.History;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CompanyMapper {
    List<CompanyInfo> selectCompanyInfoAll();
    List<History> selectHistoryAll();
}
