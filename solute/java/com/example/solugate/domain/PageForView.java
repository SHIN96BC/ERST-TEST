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
    private String searchKeyword;

    public PageForView(int nowPage, int onePageCount, int totalPageCount, int onePageLength, String searchKeyword) {
        this.nowPage = nowPage;
        this.onePageCount = onePageCount;
        this.totalPageCount = totalPageCount;
        this.onePageLength = onePageLength;
        this.searchKeyword = searchKeyword;
    }
    public PageForView(int nowPage, int onePageCount, String searchKeyword) {
        this.nowPage = nowPage;
        this.onePageCount = onePageCount;
        this.searchKeyword = searchKeyword;
    }
}
