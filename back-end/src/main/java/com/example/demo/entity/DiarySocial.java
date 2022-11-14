package com.example.demo.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
@Table(name = "diary_social")
public class DiarySocial {
    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "diary_id", nullable = false)
    private Integer diaryId;

    @Column(name = "account", nullable = false)
    private String account;
}
