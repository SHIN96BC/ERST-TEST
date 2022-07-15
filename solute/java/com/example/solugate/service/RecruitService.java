package com.example.solugate.service;

import com.example.solugate.domain.*;

import java.util.List;

public interface RecruitService {
    List<Recruit> findByRecruitAll();
    RecruitListAndPage setOnePage(String nowPageStr, String onePageCountStr, String keyword);
    RecruitContentForView findByRecruitContent(String idStr);
    List<String> setSearchSupport(String keyword);
}
