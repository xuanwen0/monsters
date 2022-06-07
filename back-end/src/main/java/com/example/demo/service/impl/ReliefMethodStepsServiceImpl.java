package com.example.demo.service.impl;

import com.example.demo.bean.ReliefMethodStepsBean;
import com.example.demo.dao.ReliefMethodStepsDAO;
import com.example.demo.entity.ReliefMethodSteps;
import com.example.demo.service.ReliefMethodStepsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReliefMethodStepsServiceImpl extends BaseServiceImplement<ReliefMethodStepsDAO, ReliefMethodSteps, ReliefMethodStepsBean> implements ReliefMethodStepsService {

    @Autowired
    private final ReliefMethodStepsDAO reliefMethodStepsDAO;

    public ReliefMethodStepsServiceImpl(ReliefMethodStepsDAO baseDAO) {
        super(baseDAO);
        this.reliefMethodStepsDAO = baseDAO;
    }

    @Override
    public ReliefMethodStepsBean createAndReturnBean(ReliefMethodStepsBean bean) {
        return null;
    }
    public List<ReliefMethodSteps> find(){
        return reliefMethodStepsDAO.searchAll();
    }


    @Override
    protected ReliefMethodSteps createVO(ReliefMethodStepsBean bean) {
        ReliefMethodSteps entity = new ReliefMethodSteps();
        entity.setId(bean.getId());
        entity.setRelief_method_id(bean.getRelief_method_id());
        entity.setIntroduce(bean.getIntroduce());
        return entity;
    }

    @Override
    protected ReliefMethodStepsBean createBean(ReliefMethodSteps entity) {
        ReliefMethodStepsBean bean = new ReliefMethodStepsBean();
        bean.setId(entity.getId());
        bean.setRelief_method_id(entity.getRelief_method_id());
        bean.setIntroduce(entity.getIntroduce());
        return bean;
    }
}
