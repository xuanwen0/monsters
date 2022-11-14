package com.example.demo.entity.enumerate;

public enum AnnoyanceTypeEnum {
    LESSONS(0), CAUSE(1), LOVE(2), FRIENDSHIP(3), AFFECTION(4), OTHERS(5);
    private final int id;

    AnnoyanceTypeEnum(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }
}