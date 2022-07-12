package com.example.solugate.service;

import com.example.solugate.domain.PageForView;
import com.example.solugate.domain.Recruit;
import com.example.solugate.domain.RecruitForView;
import com.example.solugate.domain.RecruitListAndPage;

import java.util.List;

public interface RecruitService {
    List<Recruit> findByRecruitAll();
    RecruitListAndPage setOnePage(String nowPageStr, String onePageCountStr, String lastIdStr);
}
