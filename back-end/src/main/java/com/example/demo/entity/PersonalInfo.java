package com.example.demo.entity;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.time.LocalDate;

@Data
@Entity
@Table(name = "personal_info")
public class PersonalInfo {
    @Id
    @Column(name = "`account`", nullable = false)
    private String account;

    @Column(name = "`password`", nullable = false)
    private String password;

    @Column(name = "`birthday`", nullable = false)
    private LocalDate birthday;

    @Column(name = "`name`", nullable = false)
    private String name;

    @Column(name = "`nick_name`", nullable = false)
    private String nickName;

    @Column(name = "`gender`", nullable = false)
    private int gender;

    @Column(name = "`mail`", nullable = false)
    private String mail;

    @Column(name = "`lock`")
    private String lock;

    @Column(name = "`photo`")
    private String photo;

    @Column(name = "`theme`")
    private int theme;
}
