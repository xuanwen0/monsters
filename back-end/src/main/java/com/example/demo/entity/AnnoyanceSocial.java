package com.example.demo.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
@Table(name = "annoyance_social")
public class AnnoyanceSocial {
    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "annoyance_id", nullable = false)
    private Integer annoyanceId;

    @Column(name = "account", nullable = false)
    private String account;
}
