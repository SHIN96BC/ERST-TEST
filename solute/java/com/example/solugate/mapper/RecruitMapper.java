package com.example.solugate.mapper;

import com.example.solugate.domain.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface RecruitMapper {
    List<Recruit> selectRecruitAll();
    List<RecruitForView> selectRecruitList(PageForDB pageForDB);
    List<Recruit> selectOneRecruit(PageForDB pageForDB);
    List<RecruitContent> selectRecruitIdContentAll(long id);
    List<String> selectSearchSubject(String keyword);
}
