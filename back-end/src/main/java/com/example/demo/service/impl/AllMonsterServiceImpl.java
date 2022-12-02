package com.example.demo.service.impl;

import com.example.demo.bean.AllMonsterBean;
import com.example.demo.dao.AllMonsterDAO;
import com.example.demo.entity.AllMonster;
import com.example.demo.service.AllMonsterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
public class AllMonsterServiceImpl extends BaseServiceImplement<AllMonsterDAO, AllMonster, AllMonsterBean> implements AllMonsterService {
    @Autowired
    private final AllMonsterDAO allMonsterDAO;

    public AllMonsterServiceImpl(AllMonsterDAO baseDAO) {
        super(baseDAO);
        this.allMonsterDAO =baseDAO;
    }

    @Transactional
    @Override
    public AllMonsterBean createAndReturnBean(AllMonsterBean bean) {
        AllMonster allMonster = createVO(bean);
        allMonsterDAO.insert(allMonster);
        return createBean(allMonster);
    }

    @Override
    protected AllMonster createVO(AllMonsterBean bean) {
        AllMonster entity = new AllMonster();
        entity.setId(bean.getId());
        entity.setNameChinese(bean.getNameChinese());
        entity.setNameEnglish(bean.getNameEnglish());
        entity.setPhoto(bean.getPhoto());
        entity.setAvatar(bean.getAvatar());
        entity.setRightGif(bean.getRightGif());
        entity.setLeftGif(bean.getLeftGif());
        entity.setGroup(bean.getGroup());
        entity.setMain(bean.getMain());
        return entity;
    }

    @Override
    protected AllMonsterBean createBean(AllMonster entity) {
        AllMonsterBean bean = new AllMonsterBean();
        bean.setId(entity.getId());
        bean.setNameChinese(entity.getNameChinese());
        bean.setNameEnglish(entity.getNameEnglish());
        bean.setPhoto(entity.getPhoto());
        bean.setAvatar(entity.getAvatar());
        bean.setRightGif(entity.getRightGif());
        bean.setLeftGif(entity.getLeftGif());
        bean.setGroup(entity.getGroup());
        bean.setMain(entity.getMain());
        return bean;
    }
}
