package com.example.demo.bean;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class AnnoyanceSocialCommentBean {
    private Integer id;
    private String commentUsr;
    private Integer annoyanceSocialId;
    private String content;
    private LocalDateTime date = LocalDateTime.now();
}
