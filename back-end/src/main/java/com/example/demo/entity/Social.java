package com.example.demo.entity;

import lombok.Data;

import javax.persistence.*;


@Entity
@Data
@Table(name = "social")
public class Social {
    @Id
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "account", nullable = false)
    private String account;

    @Column(name = "content", nullable = false)
    private String content;

    @Column(name = "likes", nullable = false)
    private Integer likes;
}
