package com.example.demo.service.impl;

import com.example.demo.bean.PersonalInfoBean;
import com.example.demo.dao.PersonalInfoDAO;
import com.example.demo.entity.PersonalInfo;
import com.example.demo.service.PersonalInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

import java.util.ArrayList;
import java.util.List;
@Service
public class PersonalInfoServiceImpl extends BaseServiceImplement<PersonalInfoDAO, PersonalInfo, PersonalInfoBean> implements PersonalInfoService {
    @Autowired
    private final PersonalInfoDAO personalInfoDAO;
    private final PasswordEncoder passwordEncoder;

    public PersonalInfoServiceImpl(PersonalInfoDAO personalInfoDAO, PasswordEncoder passwordEncoder) {
        super(personalInfoDAO);
        this.personalInfoDAO = personalInfoDAO;
        this.passwordEncoder = passwordEncoder;
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
    public List<PersonalInfoBean> searchPersonalInfoByAccount(String account){
        List<PersonalInfo> userList = personalInfoDAO.findByAccount(account);
        List<PersonalInfoBean> personalInfoBeanList = new ArrayList<>();
        for(PersonalInfo personalInfo : userList){
            personalInfoBeanList.add(createBean(personalInfo));
        }
        return personalInfoBeanList;
    }


    @Override
    @Transactional(readOnly = false)
    public void dailyTest(String account, PersonalInfoBean personalInfoBean) {
        PersonalInfo personalInfo = createVO(personalInfoBean);
        Optional<PersonalInfo> personalInfoOptional = personalInfoDAO.getByPK(account);
        personalInfo.setDailyTest(personalInfoOptional.get().getDailyTest() + 1);
        personalInfoDAO.update(personalInfo);
        createBean(personalInfo);
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
        entity.setDailyTest(bean.getDailyTest());
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
        bean.setDailyTest(entity.getDailyTest());
        return bean;
    }
}
