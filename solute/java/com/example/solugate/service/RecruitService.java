package com.example.solugate.service;

import com.example.solugate.domain.Recruit;
import com.example.solugate.domain.RecruitForView;
import com.example.solugate.domain.SetPage;

import java.util.List;

public interface RecruitService {
    List<Recruit> findByRecruitAll();
    List<RecruitForView> setOnePage(int nowPage, int onePageCount);
}
