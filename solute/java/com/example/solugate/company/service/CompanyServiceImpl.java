package com.example.solugate.company.service;

import com.example.solugate.company.domain.CompanyInfo;
import com.example.solugate.company.domain.History;
import com.example.solugate.company.domain.HistoryForView;
import com.example.solugate.company.repository.CompanyRepository;
import com.example.solugate.module.OddAndEven;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.example.solugate.constant.CompanyConstant.ODD;
import static com.example.solugate.constant.CompanyConstant.EVEN;

@Service
@RequiredArgsConstructor
public class CompanyServiceImpl implements CompanyService{
    Logger logger = LoggerFactory.getLogger(CompanyServiceImpl.class);

    private final CompanyRepository companyRepository;

    @Override
    public List<CompanyInfo> findByCompanyInfoAll() {
        return companyRepository.selectCompanyInfoAll();
    }

    @Override
    public Map<String, List<HistoryForView>> findByHistoryAll() {
        // 연혁 부분은 년도 별로 나눠지며, '왼쪽에 홀수', '오른쪽에 짝수'가 배치되므로, 그 처리를 여기서 해줍니다.
        // 먼저 왼쪽 오른쪽 즉, 짝수, 홀수를 나눠야하고 그 다음으로는 년도 별로 나눠줘야합니다.
        List<History> historyList = companyRepository.selectHistoryAll();
        List<HistoryForView> leftOddList = new ArrayList<>();
        List<HistoryForView> rightEvenList = new ArrayList<>();

        for(History history: historyList) {
            String date = history.getDate();
            String year = date.substring(0, date.indexOf("-"));
            String month = date.substring(date.indexOf("-")+1);
            HistoryForView historyForView = new HistoryForView(
                    history.getId(), date, history.getContent(),
                    history.getPhoto(), year, month
            );
            // 년도가 홀수인지 짝수인지 검사해서 각각 다른 List 에 담아줍니다.
            OddAndEven oddAndEven = new OddAndEven();
            switch (oddAndEven.checkOddAndEven(year)) {
                case ODD:
                    leftOddList.add(historyForView);
                    break;
                case EVEN:
                    rightEvenList.add(historyForView);
                    break;
                default:
                    return null;
            }
        }
        // controller 로 return 할때는 2개의 list 를 보내야 하기 때문에 map 형태로 넘겨줍니다.
        return new HashMap<String, List<HistoryForView>>(){
            {
                put("left", leftOddList);
                put("right", rightEvenList);
            }
        };
    }
}
