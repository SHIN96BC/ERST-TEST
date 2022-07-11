package com.example.solugate.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class RecruitQualification {
    private long id;
    private String photo;
    private long recruitId;

    public RecruitQualification(long id, String photo, long recruitId) {
        this.id = id;
        this.photo = photo;
        this.recruitId = recruitId;
    }
}
