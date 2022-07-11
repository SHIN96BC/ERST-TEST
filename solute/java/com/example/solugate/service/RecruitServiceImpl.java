package com.example.solugate.service;

import com.example.solugate.domain.Recruit;
import com.example.solugate.domain.RecruitForView;
import com.example.solugate.domain.SetPage;
import com.example.solugate.mapper.RecruitMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class RecruitServiceImpl implements RecruitService{
    private final RecruitMapper recruitMapper;

    @Override
    public List<Recruit> findByRecruitAll() {
        return recruitMapper.selectRecruitAll();
    }

    @Override
    public List<RecruitForView> setOnePage(int nowPage, int onePageCount) {
        SetPage setPage = null;
        return recruitMapper.selectRecruitPage(setPage);
    }
}
