package com.example.demo.entity;

import com.example.demo.config.DatabaseConfig;
import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.time.LocalDate;

@Data
@Entity
@Table(name = "personal_info", schema = DatabaseConfig.DATA_BASE_NAME)
public class PersonalInfo {
    @Id
    @Column(name = "`account`", nullable = false, length = 45)
    private String account;

    @Column(name = "`password`", nullable = false)
    private String password;

    @Column(name = "`birthday`", nullable = false)
    private LocalDate birthday;

    @Column(name = "`nick_name`", nullable = false, length = 45)
    private String nickName;

    @Column(name = "`mail`", nullable = false)
    private String mail;

    @Column(name = "`lock`", length = 4)
    private String lock;

    @Column(name = "`photo`")
    private String photo;

    @Column(name = "daily_test")
    private int dailyTest;
}
