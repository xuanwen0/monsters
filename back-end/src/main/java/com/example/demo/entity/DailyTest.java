package com.example.demo.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
@Table(name = "daily_test")
public class DailyTest {
    @Id
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "question",nullable = false)
    private String question;

    @Column(name = "option_one",nullable = false)
    private String option_one;

    @Column(name = "option_two",nullable = false)
    private String option_two;

    @Column(name = "option_three",nullable = false)
    private String option_three;

    @Column(name = "option_four",nullable = false)
    private String option_four;

    @Column(name = "answer", nullable = false)
    private Integer answer;

    @Column(name = "learn", nullable = false)
    private  String learn;
}
