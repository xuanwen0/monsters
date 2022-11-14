package com.example.demo.entity;

import lombok.Data;

import javax.persistence.*;


@Entity
@Data
@Table(name = "all_monster")
public class AllMonster {
    @Id
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "name_chinese", nullable = false)
    private String nameChinese;

    @Column(name = "name_english", nullable = false)
    private String nameEnglish;

    @Column(name = "photo", nullable = false)
    private String photo;

    @Column(name = "avatar", nullable = false)
    private String avatar;

    @Column(name = "gif_right", nullable = false)
    private String gifRight;

    @Column(name = "gif_left", nullable = false)
    private String gitLeft;
}
