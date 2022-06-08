package com.example.demo.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

@Entity
@Data
@Table(name = "personal_info")
public class PersonalInfo {
    @Id
    @Column(name = "account", nullable = false)
    private String account;

    @Column(name = "password", nullable = false)
    private String password;

    @Column(name = "birthday", nullable = false)
    private Date birthday;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "nick_name", nullable = false)
    private String nick_name;

    @Column(name = "gender", nullable = false)
    private Integer gender;

    @Column(name = "mall")
    private String mall;

    @Column(name = "lock")
    private String lock;

    @Column(name = "photo")
    private String photo;

    @Column(name = "theme")
    private Integer theme;
}
