package com.example.demo.service.impl;

import com.example.demo.bean.PersonalMonsterBean;
import com.example.demo.dao.PersonalMonsterDAO;
import com.example.demo.entity.PersonalMonster;
import com.example.demo.service.PersonalMonsterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class PersonalMonsterServiceImpl extends BaseServiceImplement<PersonalMonsterDAO, PersonalMonster, PersonalMonsterBean> implements PersonalMonsterService {

    @Autowired
    private final PersonalMonsterDAO personalMonsterDAO;

    public PersonalMonsterServiceImpl(PersonalMonsterDAO personalMonsterDAO) {
        super(personalMonsterDAO);
        this.personalMonsterDAO = personalMonsterDAO;
    }


    @Override
    @Transactional
    public PersonalMonsterBean createAndReturnBean(PersonalMonsterBean bean) {
        PersonalMonster personalMonster = createVO(bean);
        personalMonsterDAO.insert(personalMonster);
        return createBean(personalMonster);
    }

    @Override
    public List<PersonalMonsterBean> findByAccount(String account) {
        List<PersonalMonster> userList = personalMonsterDAO.findByAccount(account);
        List<PersonalMonsterBean> personalMonsterBeanList = new ArrayList<>();
        for (PersonalMonster personalMonster : userList) {
            personalMonsterBeanList.add(createBean(personalMonster));
        }
        return personalMonsterBeanList;
    }

    @Override
    protected PersonalMonster createVO(PersonalMonsterBean bean) {
        PersonalMonster entity = new PersonalMonster();
        entity.setAccount(bean.getAccount());
        entity.setMonsterId(bean.getMonsterId());
        entity.setMonsterGroup(bean.getMonsterGroup());
        return entity;
    }

    @Override
    protected PersonalMonsterBean createBean(PersonalMonster entity) {
        PersonalMonsterBean bean = new PersonalMonsterBean();
        bean.setAccount(entity.getAccount());
        bean.setMonsterId(entity.getMonsterId());
        bean.setMonsterGroup(entity.getMonsterGroup());
        return bean;
    }

}
