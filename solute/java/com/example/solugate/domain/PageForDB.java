package com.example.solugate.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class PageForDB {
    private long lastId;
    private long lastNumber;
    private long numberCountMin;
    private long numberCountMax;
    private long numberCountStart;

    public PageForDB(long lastId, long lastNumber, long numberCountMin, long numberCountMax, long numberCountStart) {
        this.lastId = lastId;
        this.lastNumber = lastNumber;
        this.numberCountMin = numberCountMin;
        this.numberCountMax = numberCountMax;
        this.numberCountStart = numberCountStart;
    }
}
