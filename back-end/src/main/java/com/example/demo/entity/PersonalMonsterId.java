package com.example.demo.entity;

import com.example.demo.config.DatabaseConfig;
import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

@Data
@Entity
@Table(name = "personal_monster", schema = DatabaseConfig.DATA_BASE_NAME)
public class PersonalMonsterId implements Serializable {
    @Id
    @Column(name = "`account`", nullable = false, length = 45)
    private String account;

    @Id
    @Column(name = "`monster_id`", nullable = false)
    private Integer monsterId;

}