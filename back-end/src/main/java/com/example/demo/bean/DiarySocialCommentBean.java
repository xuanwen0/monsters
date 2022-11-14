package com.example.demo.bean;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class DiarySocialCommentBean {
    private Integer id;
    private Integer diarySocialId;
    private String content;
    private Integer like;
    private LocalDateTime date = LocalDateTime.now();
}
