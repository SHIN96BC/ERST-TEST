package com.example.solugate.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Date;

@Setter
@Getter
@NoArgsConstructor
public class RecruitForView {
    private long no;
    private long id;
    private String subject;
    private String recruitStartDate;
    private String recruitEndDate;
    private Boolean fullTime;
    private int proceed;
    private long view;
    private Date createDate;
    private Date updateDate;

    public RecruitForView(long no, long id, String subject, String recruitStartDate, String recruitEndDate, Boolean fullTime, int proceed, long view, Date createDate, Date updateDate) {
        this.no = no;
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
