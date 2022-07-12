package com.example.solugate.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Setter
@Getter
@NoArgsConstructor
public class RecruitListAndPage {
    private List<RecruitForView> recruitForViewList;
    private PageForView pageForView;

    public RecruitListAndPage(List<RecruitForView> recruitForViewList, PageForView pageForView) {
        this.recruitForViewList = recruitForViewList;
        this.pageForView = pageForView;
    }
}
