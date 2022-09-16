package com.example.demo.bean;

import lombok.Data;

import java.time.LocalDate;

@Data
public class PersonalInfoBean extends BaseBean{
    private String account;
    private String password;
    private LocalDate birthday;
    private String name;
    private String nickName;
    private int gender;
    private String mail;
    private String lock;
    private String photo;
    private int theme = 1;
}
