package com.example.solugate.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class PageForDB {
    private long numberCountMin;
    private long numberCountMax;
    private String searchKeyword;

    public PageForDB(long numberCountMin, long numberCountMax, String searchKeyword) {
        this.numberCountMin = numberCountMin;
        this.numberCountMax = numberCountMax;
        this.searchKeyword = searchKeyword;
    }
}
