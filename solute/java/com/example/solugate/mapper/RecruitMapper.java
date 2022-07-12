package com.example.solugate.mapper;

import com.example.solugate.domain.Recruit;
import com.example.solugate.domain.RecruitForView;
import com.example.solugate.domain.PageForDB;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface RecruitMapper {
    List<Recruit> selectRecruitAll();
    List<RecruitForView> selectRecruitPage(PageForDB pageForDB);
    Long selectContentTotalCount();
    Long selectLastId();
}
