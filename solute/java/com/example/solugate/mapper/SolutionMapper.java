package com.example.solugate.mapper;

import com.example.solugate.domain.Solution;
import com.example.solugate.domain.SolutionContent;
import com.example.solugate.domain.SolutionPhoto;

import java.util.List;

public interface SolutionMapper {
    List<Solution> selectSolutionIdAndName();
    Solution selectSolutionId(long id);
    List<SolutionPhoto> selectSolutionPhotoId(long id);
    List<SolutionContent> selectSolutionContentId(long id);
}
