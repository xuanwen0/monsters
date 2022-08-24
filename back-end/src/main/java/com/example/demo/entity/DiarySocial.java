package com.example.demo.entity;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalDateTime;

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

    @Column(name = "like", nullable = false)
    private Integer like;

    @Column(name = "date", nullable = false)
    private LocalDateTime date;
}
