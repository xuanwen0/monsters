package com.example.demo.bean;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class AnnoyanceSocialBean {
    private Integer id;
    private Integer annoyanceId;
    private Integer like;
    private LocalDateTime date = LocalDateTime.now();
}
