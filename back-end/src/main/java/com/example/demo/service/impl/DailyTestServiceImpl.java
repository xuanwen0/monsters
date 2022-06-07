package com.example.demo.service.impl;

import com.example.demo.bean.DailyTestBean;
import com.example.demo.dao.DailyTestDAO;
import com.example.demo.entity.DailyTest;
import com.example.demo.service.DailyTestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class DailyTestServiceImpl extends BaseServiceImplement<DailyTestDAO, DailyTest, DailyTestBean> implements DailyTestService {
    @Autowired
    private final DailyTestDAO dailyTestDAO;

    public DailyTestServiceImpl(DailyTestDAO baseDAO) {
        super(baseDAO);
        this.dailyTestDAO = baseDAO;
    }

    @Override
    public DailyTestBean createAndReturnBean(DailyTestBean bean) {
        return null;
    }
    public List<DailyTest> find(){
        return dailyTestDAO.searchAll();
    }

    @Override
    protected DailyTest createVO(DailyTestBean bean) {
        DailyTest entity = new DailyTest();
        entity.setId(bean.getId());
        entity.setQuestion(bean.getQuestion());
        entity.setOption_one(bean.getOption_one());
        entity.setOption_two(bean.getOption_two());
        entity.setOption_three(bean.getOption_three());
        entity.setOption_four(bean.getOption_four());
        entity.setAnswer(bean.getAnswer());
        entity.setLearn(bean.getLearn());
        return entity;
    }

    @Override
    protected DailyTestBean createBean(DailyTest entity) {
        DailyTestBean bean = new DailyTestBean();
        bean.setId(entity.getId());
        bean.setQuestion(entity.getQuestion());
        bean.setOption_one(entity.getOption_one());
        bean.setOption_two(entity.getOption_two());
        bean.setOption_three(entity.getOption_three());
        bean.setOption_four(entity.getOption_four());
        bean.setAnswer(entity.getAnswer());
        bean.setLearn(entity.getLearn());
        return bean;
    }
}
