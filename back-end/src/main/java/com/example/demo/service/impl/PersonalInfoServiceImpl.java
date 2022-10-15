package com.example.demo.service.impl;

import com.example.demo.bean.PersonalInfoBean;
import com.example.demo.dao.PersonalInfoDAO;
import com.example.demo.entity.PersonalInfo;
import com.example.demo.service.PersonalInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

@Service
public class PersonalInfoServiceImpl extends BaseServiceImplement<PersonalInfoDAO, PersonalInfo, PersonalInfoBean> implements PersonalInfoService {
    @Autowired
    private final PersonalInfoDAO personalInfoDAO;
    private final PasswordEncoder passwordEncoder;

    public PersonalInfoServiceImpl(PersonalInfoDAO baseDAO, PersonalInfoDAO personalInfoDAO, PasswordEncoder passwordEncoder) {
        super(baseDAO);
        this.personalInfoDAO = personalInfoDAO;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public List<PersonalInfoBean> searchPersonalInfoByAccount(String account){
        List<PersonalInfo> userList = personalInfoDAO.findByAccount(account);
        List<PersonalInfoBean> personalInfoBeanList = new ArrayList<>();
        for(PersonalInfo personalInfo : userList){
            personalInfoBeanList.add(createBean(personalInfo));
        }
        return personalInfoBeanList;
    }

    @Transactional
    @Override
    public PersonalInfoBean createAndReturnBean(PersonalInfoBean bean) {
        PersonalInfo personalInfo = createVO(bean);
        personalInfo.setPassword(passwordEncoder.encode(bean.getPassword()));
        personalInfoDAO.insert(personalInfo);
        bean = createBean(personalInfo);
        return bean;
    }
    @Override
    protected PersonalInfo createVO(PersonalInfoBean bean) {
        PersonalInfo entity = new PersonalInfo();
        entity.setAccount(bean.getAccount());
        entity.setPassword(bean.getPassword());
        entity.setBirthday(bean.getBirthday());
        entity.setNickName(bean.getNickName());
        entity.setMail(bean.getMail());
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
        bean.setNickName(entity.getNickName());
        bean.setMail(entity.getMail());
        bean.setLock(entity.getLock());
        bean.setPhoto(entity.getPhoto());
        bean.setTheme(entity.getTheme());
        return bean;
    }
}
