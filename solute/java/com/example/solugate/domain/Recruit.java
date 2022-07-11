package com.example.solugate.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
@NoArgsConstructor
public class Recruit {
    private long id;
    private String subject;
    private String recruitStartDate;
    private String recruitEndDate;
    private boolean fullTime;
    private int proceed;
    private long view;
    private Date createDate;
    private Date updateDate;

    public Recruit(long id, String subject, String recruitStartDate, String recruitEndDate, boolean fullTime, int proceed, long view, Date createDate, Date updateDate) {
        this.id = id;
        this.subject = subject;
        this.recruitStartDate = recruitStartDate;
        this.recruitEndDate = recruitEndDate;
        this.fullTime = fullTime;
        this.proceed = proceed;
        this.view = view;
        this.createDate = createDate;
        this.updateDate = updateDate;
    }
}
