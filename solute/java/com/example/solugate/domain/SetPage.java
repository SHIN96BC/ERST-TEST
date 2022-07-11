package com.example.solugate.domain;

public class SetPage {
    private int nowPage;
    private int onePageCount;
    private long totalContentCount;
    private int totalPageCount;

    public SetPage(int nowPage, int onePageCount, long totalContentCount, int totalPageCount) {
        this.nowPage = nowPage;
        this.onePageCount = onePageCount;
        this.totalContentCount = totalContentCount;
        this.totalPageCount = totalPageCount;
    }
}
