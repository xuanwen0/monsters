package com.example.demo.bean;

import com.example.demo.entity.enumerate.AnnoyanceTypeEnum;
import lombok.Data;

import java.time.LocalDateTime;

@Data
public class AnnoyanceBean extends BaseBean {
    private Integer id;
    private String account;
    private String content;
    private AnnoyanceTypeEnum type;
    private int monsterId;
    private String mood;
    private int index;
    private LocalDateTime time = LocalDateTime.now();
    private int solve = 0;
    private int share;
}