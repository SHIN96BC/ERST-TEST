package com.example.solugate.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Date;

@Setter
@Getter
@NoArgsConstructor
public class RecruitForView {
    private long number;
    private long id;
    private String subject;
    private String recruitStartDate;
    private String recruitEndDate;
    private Boolean fullTime;
    private int proceed;
    private long view;
    private Date createDate;
    private Date updateDate;
    private long totalCount;

    public RecruitForView(long number, long id, String subject, String recruitStartDate, String recruitEndDate,
                          Boolean fullTime, int proceed, long view, Date createDate, Date updateDate, long totalCount) {
        this.number = number;
        this.id = id;
        this.subject = subject;
        this.recruitStartDate = recruitStartDate;
        this.recruitEndDate = recruitEndDate;
        this.fullTime = fullTime;
        this.proceed = proceed;
        this.view = view;
        this.createDate = createDate;
        this.updateDate = updateDate;
        this.totalCount = totalCount;
    }
}
