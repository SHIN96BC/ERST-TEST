package com.example.solugate.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
public class RecruitContentForView {
    private Recruit recruit;
    private List<RecruitContent> recruitContentList;

    public RecruitContentForView(Recruit recruit, List<RecruitContent> recruitContentList) {
        this.recruit = recruit;
        this.recruitContentList = recruitContentList;
    }
}
