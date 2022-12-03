package com.example.demo.dao;

import com.example.demo.entity.PersonalMonster;

import java.util.List;

public interface PersonalMonsterDAO extends BaseDAO<PersonalMonster>{
    List<PersonalMonster> findByAccount(String account);
}
