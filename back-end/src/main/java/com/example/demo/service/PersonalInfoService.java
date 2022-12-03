package com.example.demo.service;

import com.example.demo.bean.PersonalInfoBean;

import java.util.List;

public interface PersonalInfoService extends BaseService<PersonalInfoBean>{
    void dailyTest(String account, PersonalInfoBean personalInfoBean);
    List<PersonalInfoBean> searchPersonalInfoByAccount(String account);
}
