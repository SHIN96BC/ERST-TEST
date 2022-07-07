package com.example.solugate.company.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Date;

@Setter
@Getter
@NoArgsConstructor
public class History {
    private long id;
    private String date;
    private String content;
    private String photo;

    public History(long id, String date, String content, String photo) {
        this.id = id;
        this.date = date;
        this.content = content;
        this.photo = photo;
    }
}
