package com.example.solugate.service;

import com.example.solugate.domain.Solution;
import com.example.solugate.domain.SolutionContentForView;

import java.util.List;

public interface SolutionService {
    List<Solution> findBySolutionIdAndName();
    SolutionContentForView findBySolutionContent(String idStr);
}
