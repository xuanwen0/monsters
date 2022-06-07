package com.example.demo.bean;

import lombok.Data;

@Data
public class DailyTestBean extends BaseBean {
    private Integer id;
    private String question;
    private String option_one;
    private String option_two;
    private String option_three;
    private String option_four;
    private Integer answer;
    private  String learn;
}
