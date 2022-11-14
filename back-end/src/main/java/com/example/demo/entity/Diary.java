package com.example.demo.entity;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalDateTime;


@Entity
@Data
@Table(name = "diary")
public class Diary {
    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "account", nullable = false, length = 45)
    private String account;

    @Column(name = "content", nullable = false)
    private String content;

    @Column(name = "index", nullable = false)
    private Integer index;

    @Column(name = "update_date", nullable = false)
    private LocalDateTime updateDate;

    @Column(name = "share",nullable = false)
    private Integer share;
}
