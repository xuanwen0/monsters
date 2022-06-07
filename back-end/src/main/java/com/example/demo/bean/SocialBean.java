package com.example.demo.bean;

import lombok.Data;

@Data
public class SocialBean extends BaseBean {
    private Integer id;
    private String account;
    private String content;
    private Integer likes;
}
