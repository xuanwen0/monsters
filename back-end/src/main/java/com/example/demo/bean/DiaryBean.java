package com.example.demo.bean;

import lombok.Data;

import java.util.Date;

@Data
public class DiaryBean extends BaseBean {
    private Integer id;
    private String account;
    private String content;
    private Integer index;
    private Date update_date;
    private Integer share;
}
