package com.example.solugate.mapper;

import com.example.solugate.domain.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface RecruitMapper {
    List<Recruit> selectRecruitAll();
    List<RecruitForView> selectRecruitPage(PageForDB pageForDB);
    Long selectContentTotalCount();
    Long selectLastId();

    Recruit selectOneRecruit(long id);
    List<RecruitContent> selectRecruitIdContentAll(long id);
}
