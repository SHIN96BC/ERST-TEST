package com.example.solugate.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class History {
    private long id;
    private String date;
    private String content;
    private String photo;
    private String year;
    private String month;

    public History(long id, String date, String content, String photo, String year, String month) {
        this.id = id;
        this.date = date;
        this.content = content;
        this.photo = photo;
        this.year = year;
        this.month = month;
    }
}
