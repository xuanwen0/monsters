package com.example.demo.entity;

import com.example.demo.config.DatabaseConfig;
import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "personal_monster", schema = DatabaseConfig.DATA_BASE_NAME)
@IdClass(PersonalMonsterId.class)
public class PersonalMonster {
    @Id
    @Column(name = "`account`", nullable = false, length = 45)
    private String account;

    @Id
    @Column(name = "`monster_id`", nullable = false)
    private Integer monsterId;

    @Column(name = "`monster_group`", nullable = false)
    private Integer monsterGroup;
}
