package com.example.demo.bean;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class DiaryBean extends BaseBean {
    private Integer id;
    private String account;
    private String content;
    private Integer index;
    private LocalDateTime updateDate;
    private Integer share;
}
