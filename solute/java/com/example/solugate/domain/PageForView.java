package com.example.solugate.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
public class PageForView {
    private int nowPage;
    private int onePageCount;
    private int totalPageCount;
    private int onePageLength;

    public PageForView(int nowPage, int onePageCount, int totalPageCount, int onePageLength) {
        this.nowPage = nowPage;
        this.onePageCount = onePageCount;
        this.totalPageCount = totalPageCount;
        this.onePageLength = onePageLength;
    }
}
