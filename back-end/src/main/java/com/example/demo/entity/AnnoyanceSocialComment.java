package com.example.demo.entity;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Data
@Table(name = "annoyance_social_comment")
public class AnnoyanceSocialComment {

    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "annoyance_social_id", nullable = false)
    private Integer annoyanceId;

    @Column(name = "content", nullable = false)
    private String content;

    @Column(name = "like", nullable = false)
    private Integer like;

    @Column(name = "date", nullable = false)
    private LocalDateTime date;
}