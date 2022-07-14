package com.example.solugate.service;

import com.example.solugate.domain.Solution;
import com.example.solugate.domain.SolutionContent;
import com.example.solugate.domain.SolutionContentForView;
import com.example.solugate.domain.SolutionPhoto;
import com.example.solugate.mapper.SolutionMapper;
import com.example.solugate.util.CastUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class SolutionServiceImpl implements SolutionService{
    private final SolutionMapper solutionMapper;

    @Override
    public List<Solution> findBySolutionIdAndName() {
        return solutionMapper.selectSolutionIdAndName();
    }

    @Override
    public SolutionContentForView findBySolutionContent(String idStr) {
        CastUtil castUtil = new CastUtil();
        long id = castUtil.changeStringToLong(idStr);
        if(id < 1) return null;

        Solution solution = solutionMapper.selectSolutionId(id);
        List<SolutionPhoto> solutionPhotoList = solutionMapper.selectSolutionPhotoId(id);
        List<SolutionContent> solutionContentList = solutionMapper.selectSolutionContentId(id);

        if(solution.getId() < 1 || solutionPhotoList.size() == 0 || solutionContentList.size() == 0)
            return null;

        return new SolutionContentForView(
                solution, solutionPhotoList, solutionContentList
        );
    }
}
