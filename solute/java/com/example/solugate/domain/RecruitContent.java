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
    private int titleGroupId;
    private String subTitle;
    private String content;
    private String photo;
    private long recruitId;

    public RecruitContent(long id, String title, int titleGroupId, String subTitle, String content, String photo, long recruitId) {
        this.id = id;
        this.title = title;
        this.titleGroupId = titleGroupId;
        this.subTitle = subTitle;
        this.content = content;
        this.photo = photo;
        this.recruitId = recruitId;
    }
}
