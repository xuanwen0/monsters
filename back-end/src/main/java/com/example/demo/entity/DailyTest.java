package com.example.demo.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;

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
    private String optionOne;

    @Column(name = "option_two",nullable = false)
    private String optionTwo;

    @Column(name = "option_three",nullable = false)
    private String optionThree;

    @Column(name = "option_four",nullable = false)
    private String optionFour;

    @Column(name = "answer", nullable = false)
    private Integer answer;

    @Column(name = "learn", nullable = false)
    private  String learn;
}
