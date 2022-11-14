package com.example.demo.bean;

import lombok.Data;

@Data
public class DailyTestBean extends BaseBean {
    private Integer id;
    private String question;
    private String optionOne;
    private String optionTwo;
    private String optionThree;
    private String optionFour;
    private Integer answer;
    private String learn;
}
