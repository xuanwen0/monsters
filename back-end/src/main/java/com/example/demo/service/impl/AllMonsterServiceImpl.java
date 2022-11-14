package com.example.demo.service.impl;

import com.example.demo.bean.AllMonsterBean;
import com.example.demo.dao.AllMonsterDAO;
import com.example.demo.entity.AllMonster;
import com.example.demo.service.AllMonsterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AllMonsterServiceImpl extends BaseServiceImplement<AllMonsterDAO, AllMonster, AllMonsterBean> implements AllMonsterService {
    @Autowired
    private final AllMonsterDAO allMonsterDAO;

    public AllMonsterServiceImpl(AllMonsterDAO baseDAO) {
        super(baseDAO);
        this.allMonsterDAO =baseDAO;
    }

    @Override
    public AllMonsterBean createAndReturnBean(AllMonsterBean bean) {
        return null;
    }
    public List<AllMonster> find(){
        return allMonsterDAO.searchAll();
    }


    @Override
    protected AllMonster createVO(AllMonsterBean bean) {
        AllMonster entity = new AllMonster();
        entity.setId(bean.getId());
        entity.setNameChinese(bean.getNameChinese());
        entity.setNameEnglish(bean.getNameEnglish());
        entity.setPhoto(bean.getPhoto());
        entity.setAvatar(bean.getAvatar());
        entity.setGifRight(bean.getGifRight());
        entity.setGitLeft(bean.getGitLeft());
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
        bean.setGifRight(entity.getGifRight());
        bean.setGitLeft(entity.getGitLeft());
        return bean;
    }
}
