package com.example.demo.service.impl;

import com.example.demo.bean.AnnoyanceBean;
import com.example.demo.dao.AnnoyanceDAO;
import com.example.demo.entity.Annoyance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

@Service
public class AnnoyanceServiceImpl extends BaseServiceImplement<AnnoyanceDAO, Annoyance, AnnoyanceBean> implements com.example.demo.service.AnnoyanceService {
    @Autowired
    private final AnnoyanceDAO annoyanceDAO;

    public AnnoyanceServiceImpl(AnnoyanceDAO baseDAO) {
        super(baseDAO);
        this.annoyanceDAO = baseDAO;
    }

    @Transactional
    @Override
    public AnnoyanceBean createAndReturnBean(AnnoyanceBean bean) {
        annoyanceDAO.insert(createVO(bean));
        return bean;
    }
    @Override
    public List<AnnoyanceBean> searchAnnoyanceByAccount(String account){
        List<Annoyance> userList = annoyanceDAO.findByAccount(account);
        List<AnnoyanceBean> annoyanceBeanList = new ArrayList<>();
        for(Annoyance annoyance : userList){
            annoyanceBeanList.add(createBean(annoyance));
        }
        return annoyanceBeanList;
    }
    @Override
    protected Annoyance createVO(AnnoyanceBean bean) {
        Annoyance entity = new Annoyance();
        entity.setId(bean.getId());
        entity.setAccount(bean.getAccount());
        entity.setContent(bean.getContent());
        entity.setType(bean.getType());
        entity.setMonsterId(bean.getMonsterId());
        entity.setMood(bean.getMood());
        entity.setIndex(bean.getIndex());
        entity.setTime(bean.getTime());
        entity.setSolve(bean.getSolve());
        entity.setShare(bean.getShare());
        return entity;
    }
    @Override
    protected AnnoyanceBean createBean(Annoyance entity) {
        AnnoyanceBean bean = new AnnoyanceBean();
        bean.setId(entity.getId());
        bean.setAccount(entity.getAccount());
        bean.setContent(entity.getContent());
        bean.setType(entity.getType());
        bean.setMonsterId(entity.getMonsterId());
        bean.setMood(entity.getMood());
        bean.setIndex(entity.getIndex());
        bean.setTime(entity.getTime());
        bean.setSolve(entity.getSolve());
        bean.setShare(entity.getShare());
        return bean;
    }
}