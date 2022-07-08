package com.example.solugate.recruit.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Date;

@Setter
@Getter
@NoArgsConstructor
public class Recruit {
    private long id;
    private String subject;
    private String recruitStart;
    private String recruitEnd;
    private boolean fullTime;
    private int proceed;
    private long view;
    private Date createDate;
    private Date updateDate;

    public Recruit(long id, String subject, String recruitStart, String recruitEnd,
                   boolean fullTime, int proceed, long view, Date createDate,
                   Date updateDate) {
        this.id = id;
        this.subject = subject;
        this.recruitStart = recruitStart;
        this.recruitEnd = recruitEnd;
        this.fullTime = fullTime;
        this.proceed = proceed;
        this.view = view;
        this.createDate = createDate;
        this.updateDate = updateDate;
    }
}
