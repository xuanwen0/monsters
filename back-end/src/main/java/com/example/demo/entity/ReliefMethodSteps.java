package com.example.demo.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
@Table(name = "relief_method_steps")
public class ReliefMethodSteps {
    @Id
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "relief_method_id", nullable = false)
    private Integer relief_method_id;

    @Column(name = "introduce", nullable = false)
    private String introduce;
}
