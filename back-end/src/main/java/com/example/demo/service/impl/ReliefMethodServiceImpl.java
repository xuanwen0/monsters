package com.example.demo.service.impl;

import com.example.demo.bean.ReliefMethodBean;
import com.example.demo.dao.ReliefMethodDAO;
import com.example.demo.entity.ReliefMethod;
import com.example.demo.service.ReliefMethodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReliefMethodServiceImpl extends BaseServiceImplement<ReliefMethodDAO, ReliefMethod, ReliefMethodBean> implements ReliefMethodService {

    @Autowired
    private final ReliefMethodDAO reliefMethodDAO;

    public ReliefMethodServiceImpl(ReliefMethodDAO baseDAO) {
        super(baseDAO);
        this.reliefMethodDAO = baseDAO;
    }

    @Override
    public ReliefMethodBean createAndReturnBean(ReliefMethodBean bean) {
        return null;
    }
    public List<ReliefMethod> find(){
        return reliefMethodDAO.searchAll();
    }

    @Override
    protected ReliefMethod createVO(ReliefMethodBean bean) {
        ReliefMethod entity = new ReliefMethod();
        entity.setId(bean.getId());
        entity.setName(bean.getName());
        entity.setIntroduce(bean.getIntroduce());
        return entity;
    }

    @Override
    protected ReliefMethodBean createBean(ReliefMethod entity) {
        ReliefMethodBean bean = new ReliefMethodBean();
        bean.setId(entity.getId());
        bean.setName(entity.getName());
        bean.setIntroduce(entity.getIntroduce());
        return bean;
    }
}
