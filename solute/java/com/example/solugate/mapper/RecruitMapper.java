package com.example.solugate.mapper;

import com.example.solugate.domain.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface RecruitMapper {
    List<Recruit> selectRecruitAll();
    List<RecruitForView> selectRecruitList(PageForDB pageForDB);
    Recruit selectOneRecruit(long id);
    List<RecruitContent> selectRecruitIdContentAll(long id);
    List<String> selectSearchSubject(String keyword);
}
