package com.example.demo.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.*;


@Entity
@Data
@Table(name = "answer_book")
public class AnswerBook {
    @Id
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "content", nullable = false)
    private String content;
}
