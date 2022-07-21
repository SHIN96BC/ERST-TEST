package com.example.solugate.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
public class RecruitContentForView {
    private long nowId;
    private List<Recruit> recruitList;
    private List<RecruitContent> recruitContentList;
    private PageForView pageForView;

    public RecruitContentForView(long nowId, List<Recruit> recruitList, List<RecruitContent> recruitContentList, PageForView pageForView) {
        this.nowId = nowId;
        this.recruitList = recruitList;
        this.recruitContentList = recruitContentList;
        this.pageForView = pageForView;
    }
}
