package com.example.demo.bean;

import lombok.Data;

import java.util.Date;

@Data
public class PersonalInfoBean extends BaseBean {
    private String account;
    private String password;
    private Date birthday;
    private String name;
    private String nick_name;
    private Integer gender;
    private String mall;
    private String lock;
    private String photo;
    private Integer theme;
}
