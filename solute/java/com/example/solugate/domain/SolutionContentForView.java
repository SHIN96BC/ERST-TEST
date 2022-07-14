package com.example.solugate.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
public class SolutionContentForView {
    private Solution solution;
    private List<SolutionPhoto> solutionPhotoList;
    private List<SolutionContent> solutionContentList;

    public SolutionContentForView(Solution solution, List<SolutionPhoto> solutionPhotoList, List<SolutionContent> solutionContentList) {
        this.solution = solution;
        this.solutionPhotoList = solutionPhotoList;
        this.solutionContentList = solutionContentList;
    }
}
