package com.example.demo.service;

import com.example.demo.bean.AnnoyanceBean;
import com.example.demo.bean.PersonalInfoBean;

import java.util.List;

public interface PersonalInfoService extends BaseService<PersonalInfoBean>{
    List<PersonalInfoBean> searchPersonalInfoByAccount(String account);
}
