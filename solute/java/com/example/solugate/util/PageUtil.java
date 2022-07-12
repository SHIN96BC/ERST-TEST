package com.example.solugate.util;

public class PageUtil {
    public int calculateTotalPageCount(int onePageCount, long totalContentCount) {
        int totalPageCount = -1;
        if(totalContentCount % onePageCount == 0) {
            totalPageCount = (int)(totalContentCount / onePageCount);
        }else {
            totalPageCount = (int)(totalContentCount / onePageCount + 1);
        }
        return totalPageCount;
    }
}
