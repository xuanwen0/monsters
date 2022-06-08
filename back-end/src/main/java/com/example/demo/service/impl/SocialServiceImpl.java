package com.example.demo.service.impl;

import com.example.demo.bean.SocialBean;
import com.example.demo.dao.SocialDAO;
import com.example.demo.entity.Social;
import com.example.demo.service.SocialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SocialServiceImpl extends BaseServiceImplement<SocialDAO, Social, SocialBean> implements SocialService {
    @Autowired
    private final SocialDAO socialDAO;

    public SocialServiceImpl(SocialDAO baseDAO) {
        super(baseDAO);
        this.socialDAO = baseDAO;
    }

    @Override
    public SocialBean createAndReturnBean(SocialBean bean) {
        return null;
    }
    public List<Social> find(){
        return socialDAO.searchAll();
    }

    @Override
    protected Social createVO(SocialBean bean) {
        Social entity = new Social();
        entity.setId(bean.getId());
        entity.setAccount(bean.getAccount());
        entity.setContent(bean.getContent());
        entity.setLikes(bean.getLikes());
        return entity;

    }

    @Override
    protected SocialBean createBean(Social entity) {
       SocialBean bean = new SocialBean();
       bean.setId(entity.getId());
       bean.setAccount(entity.getAccount());
       bean.setContent(entity.getContent());
       bean.setLikes(entity.getLikes());
       return bean;
    }
}
