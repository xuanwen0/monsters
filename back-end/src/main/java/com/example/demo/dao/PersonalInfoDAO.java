package com.example.demo.dao;

import com.example.demo.entity.Annoyance;
import com.example.demo.entity.PersonalInfo;

import java.util.List;

public interface PersonalInfoDAO extends BaseDAO<PersonalInfo>{
    List<PersonalInfo> findByAccount(String account);
}
