package com.example.solugate.service;

import com.example.solugate.domain.*;
import com.example.solugate.mapper.RecruitMapper;
import com.example.solugate.util.CastUtil;
import com.example.solugate.util.PageUtil;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import static com.example.solugate.constant.PageConstant.RECRUIT_ONE_PAGE_COUNT;
import static com.example.solugate.constant.PageConstant.RECRUIT_MIN_PAGE_COUNT;
import static com.example.solugate.constant.PageConstant.RECRUIT_PAGE_LENGTH;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class RecruitServiceImpl implements RecruitService{
    Logger logger = LoggerFactory.getLogger(RecruitServiceImpl.class);
    private final RecruitMapper recruitMapper;

    @Override
    public List<Recruit> findByRecruitAll() {
        return recruitMapper.selectRecruitAll();
    }

    @Override
    public RecruitListAndPage setOnePage(String nowPageStr, String onePageCountStr, String keyword) {
        logger.info("service keyword = " + keyword);

        CastUtil castUtil = new CastUtil();
        int nowPage = castUtil.changeStringToInt(nowPageStr);
        int onePageCount = castUtil.changeStringToInt(onePageCountStr);
        // 페이지 계산에 필요한 현재 페이지 = nowPage 와 한페이지에 표시할 계시글 개수 = onePageCount (최소 표시 개수를 5개로 제한합니다.)
        if(nowPage < 1) nowPage = 1;
        if(onePageCount < RECRUIT_MIN_PAGE_COUNT) onePageCount = RECRUIT_ONE_PAGE_COUNT;

        long numberCountMin = -1L;
        long numberCountMax = -1L;

        // 한페이지에 보여줄 게시글 만큼만 뽑아오기위해 사용할 rownum 의 범위
        if (nowPage > 1) {
            numberCountMin = onePageCount * (nowPage - 1) + 1;
            numberCountMax = onePageCount * nowPage;
        }else {
            numberCountMin = 1;
            numberCountMax = onePageCount;
        }

        if(keyword != null)
            keyword = keyword.trim();
        else
            keyword = "";

        // DB 핸들링을 위해 필요한 객체 PageForDB 를 생성해서 RecruitForView List 를 받아옵니다.
        PageForDB pageForDB = new PageForDB(numberCountMin, numberCountMax, keyword);

        logger.info("pageForDB.getSearchKeyword = " + pageForDB.getSearchKeyword());

        List<RecruitForView> recruitForViewList = recruitMapper.selectRecruitList(pageForDB);

        // 아래쪽에 페이지 번호를 세팅하기위해 필요한 객체입니다.
        PageUtil pageUtil = new PageUtil();

        int totalPageCount = 1;
        if(recruitForViewList.size() > 0){
            totalPageCount = pageUtil.calculateTotalPageCount(onePageCount, recruitForViewList.get(0).getTotalCount());
        }
        // List 와 페이징 객체를 함께 컨트롤러로 전달해야해서 RecruitListAndPage 라는 객체에 담아서 전달합니다.
        PageForView pageForView = new PageForView(nowPage, onePageCount, totalPageCount, RECRUIT_PAGE_LENGTH, keyword);
        return new RecruitListAndPage(recruitForViewList, pageForView);
    }

    @Override
    public RecruitContentForView findByRecruitContent(String idStr) {
        CastUtil castUtil = new CastUtil();
        long id = castUtil.changeStringToLong(idStr);
        if(id < 0)
            return null;

        Recruit recruit = recruitMapper.selectOneRecruit(id);
        List<RecruitContent> recruitContentList = recruitMapper.selectRecruitIdContentAll(id);

        if(recruit == null || recruit.getId() < 1 || recruitContentList.size() == 0)
            return null;

        return new RecruitContentForView(recruit, recruitContentList);
    }

    @Override
    public List<String> setSearchSupport(String keyword) {
        return recruitMapper.selectSearchSubject(keyword);
    }

}
