package com.example.solugate.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class SolutionPhoto {
    private long id;
    private String photo;
    private long solutionId;

    public SolutionPhoto(long id, String photo, long solutionId) {
        this.id = id;
        this.photo = photo;
        this.solutionId = solutionId;
    }
}
