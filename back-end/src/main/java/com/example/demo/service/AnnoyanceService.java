package com.example.demo.service;

import com.example.demo.bean.AnnoyanceBean;
import com.example.demo.dao.AnnoyanceDAO;
import com.example.demo.entity.Annoyance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Service
public class AnnoyanceService {
    @Autowired
    private final AnnoyanceDAO annoyanceDAO;

    public AnnoyanceService(AnnoyanceDAO annoyanceDAO) {
        this.annoyanceDAO = annoyanceDAO;
    }

    public AnnoyanceBean create(AnnoyanceBean annoyanceBean) {
        Annoyance annoyance = createVO(annoyanceBean);
        return createBean(annoyanceDAO.save(annoyance));
    }

    protected Annoyance createVO(AnnoyanceBean bean) {
        Annoyance entity = new Annoyance();
        entity.setId(bean.getId());
        entity.setAccount(bean.getAccount());
        entity.setContext(bean.getContext());
        entity.setType(bean.getType());
        entity.setDallId(bean.getDallId());
        entity.setMood(bean.getMood());
        entity.setIndex(bean.getIndex());
        entity.setTime(bean.getTime());
        entity.setSolve(bean.getSolve());
        entity.setShare(bean.getShare());
        return entity;
    }

    protected AnnoyanceBean createBean(Annoyance entity) {
        AnnoyanceBean bean = new AnnoyanceBean();
        bean.setId(entity.getId());
        bean.setAccount(entity.getAccount());
        bean.setContext(entity.getContext());
        bean.setType(entity.getType());
        bean.setDallId(entity.getDallId());
        bean.setMood(entity.getMood());
        bean.setIndex(entity.getIndex());
        bean.setTime(entity.getTime());
        bean.setSolve(entity.getSolve());
        bean.setShare(entity.getShare());
        return bean;
    }

}