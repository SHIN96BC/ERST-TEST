package com.example.solugate.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class SolutionContent {
    private long id;
    private String content;
    private long solutionId;

    public SolutionContent(long id, String content, long solutionId) {
        this.id = id;
        this.content = content;
        this.solutionId = solutionId;
    }
}
