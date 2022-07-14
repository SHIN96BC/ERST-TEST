package com.example.solugate.service;

import com.example.solugate.domain.CompanyInfo;
import com.example.solugate.domain.History;
import com.example.solugate.mapper.CompanyMapper;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class CompanyServiceImpl implements CompanyService{
    Logger logger = LoggerFactory.getLogger(CompanyServiceImpl.class);

    private final CompanyMapper companyMapper;

    @Override
    public List<CompanyInfo> findByCompanyInfoAll() {
        return companyMapper.selectCompanyInfoAll();
    }

    @Override
    public List<History> findByHistoryAll() {
        // 연혁 부분은 년도 별로 나눠지며, '왼쪽에 홀수', '오른쪽에 짝수'가 배치되므로, 그 처리를 여기서 해줍니다.
        // 먼저 왼쪽 오른쪽 즉, 짝수, 홀수를 나눠야하고 그 다음으로는 년도 별로 나눠줘야합니다.
        List<History> historyList = companyMapper.selectHistoryAll();

        for(History history: historyList) {
            String date = history.getDate();
            String year = date.substring(0, date.indexOf("-"));
            String month = date.substring(date.indexOf("-")+1);
            history.setYear(year);
            history.setMonth(month);
        }

        return historyList;
    }
}
