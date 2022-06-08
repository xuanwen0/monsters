package com.example.demo.entity;

import lombok.Data;

import javax.persistence.*;


@Entity
@Data
@Table(name = "theme")
public class Theme {
    @Id
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "color_number", nullable = false)
    private String color_number;
}
