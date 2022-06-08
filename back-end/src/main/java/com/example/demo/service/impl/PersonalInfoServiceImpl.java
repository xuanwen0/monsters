package com.example.demo.service.impl;

import com.example.demo.bean.PersonalInfoBean;
import com.example.demo.dao.PersonalInfoDAO;
import com.example.demo.entity.PersonalInfo;
import com.example.demo.service.PersonalInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PersonalInfoServiceImpl extends BaseServiceImplement<PersonalInfoDAO, PersonalInfo, PersonalInfoBean> implements PersonalInfoService {
    @Autowired
    private final PersonalInfoDAO personalInfoDAO;

    public PersonalInfoServiceImpl(PersonalInfoDAO baseDAO) {
        super(baseDAO);
        this.personalInfoDAO = baseDAO;
    }

    @Override
    public PersonalInfoBean createAndReturnBean(PersonalInfoBean bean) {
        return null;
    }

    public List<PersonalInfo> find(){
        return personalInfoDAO.searchAll();
    }


    @Override
    protected PersonalInfo createVO(PersonalInfoBean bean) {
        PersonalInfo entity = new PersonalInfo();
        entity.setAccount(bean.getAccount());
        entity.setPassword(bean.getPassword());
        entity.setBirthday(bean.getBirthday());
        entity.setName(bean.getName());
        entity.setNick_name(bean.getNick_name());
        entity.setGender(bean.getGender());
        entity.setMall(bean.getMall());
        entity.setLock(bean.getLock());
        entity.setPhoto(bean.getPhoto());
        entity.setTheme(bean.getTheme());
        return entity;
    }

    @Override
    protected PersonalInfoBean createBean(PersonalInfo entity) {
        PersonalInfoBean bean = new PersonalInfoBean();
        bean.setAccount(entity.getAccount());
        bean.setPassword(entity.getPassword());
        bean.setBirthday(entity.getBirthday());
        bean.setName(entity.getName());
        bean.setNick_name(entity.getNick_name());
        bean.setGender(entity.getGender());
        bean.setMall(entity.getMall());
        bean.setLock(entity.getLock());
        bean.setPhoto(entity.getPhoto());
        bean.setTheme(entity.getTheme());
        return bean;
    }
}
