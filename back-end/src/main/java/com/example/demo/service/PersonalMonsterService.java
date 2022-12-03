package com.example.demo.service;

import com.example.demo.bean.PersonalMonsterBean;

import java.util.List;

public interface PersonalMonsterService  extends BaseService<PersonalMonsterBean>{
    List<PersonalMonsterBean> findByAccount(String account);
}
