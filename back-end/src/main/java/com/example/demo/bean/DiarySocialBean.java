package com.example.demo.bean;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class DiarySocialBean {
    private Integer id;
    private Integer diaryId;
    private Integer like;
    private LocalDateTime date = LocalDateTime.now();
}
