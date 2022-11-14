package com.example.demo.bean;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class DiarySocialCommentBean {
    private Integer id;
    private String commentUser;
    private Integer diarySocialId;
    private String content;
    private LocalDateTime date = LocalDateTime.now();
}
