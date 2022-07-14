package com.example.solugate.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Solution {
    private long id;
    private String name;
    private String fullName;
    private String explanation;

    public Solution(long id, String name, String fullName, String explanation) {
        this.id = id;
        this.name = name;
        this.fullName = fullName;
        this.explanation = explanation;
    }
}
