package com.example.demo.entity;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalDateTime;


@Entity
@Data
@Table(name = "diary")
public class Diary {
    @Id
    @Column(name = "`id`", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "`account`", nullable = false, length = 45)
    private String account;

    @Column(name = "`content`", nullable = false)
    private String content;

    @Column(name = "`monster_Id`", nullable = false)
    private int monsterId;

    @Column(name = "`mood`", nullable = false)
    private String mood;

    @Column(name = "`index`", nullable = false)
    private Integer index;

    @Column(name = "`time`", nullable = false)
    private LocalDateTime time;

    @Column(name = "`share`",nullable = false)
    private Integer share;
}
