package com.example.demo.entity.enumerate;

public enum AnnoyanceTypeEnum {
    LESSONS(1), CAUSE(2), LOVE(3), FRIENDSHIP(4), AFFECTION(5), OTHERS(6);
    private final int id;

    AnnoyanceTypeEnum(int id) {
        this.id = id;
    }
}