package com.example.solugate.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class RecruitContent {
    private long id;
    private String title;
    private String subTitle;
    private String content;
    private long recruitId;

    public RecruitContent(long id, String title, String subTitle, String content, long recruitId) {
        this.id = id;
        this.title = title;
        this.subTitle = subTitle;
        this.content = content;
        this.recruitId = recruitId;
    }
}
