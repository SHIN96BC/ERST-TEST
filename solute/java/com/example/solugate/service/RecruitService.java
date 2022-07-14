package com.example.solugate.service;

import com.example.solugate.domain.*;

import java.util.List;

public interface RecruitService {
    List<Recruit> findByRecruitAll();
    RecruitListAndPage setOnePage(String nowPageStr, String onePageCountStr, String lastIdStr);
    RecruitContentForView findByRecruitContent(String idStr);
}
