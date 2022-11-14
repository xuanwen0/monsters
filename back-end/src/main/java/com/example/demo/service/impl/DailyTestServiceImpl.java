package com.example.demo.service.impl;

import com.example.demo.bean.DailyTestBean;
import com.example.demo.dao.DailyTestDAO;
import com.example.demo.entity.DailyTest;
import com.example.demo.service.DailyTestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


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

    @Override
    protected DailyTest createVO(DailyTestBean bean) {
        DailyTest entity = new DailyTest();
        entity.setId(bean.getId());
        entity.setQuestion(bean.getQuestion());
        entity.setOptionOne(bean.getOptionOne());
        entity.setOptionTwo(bean.getOptionTwo());
        entity.setOptionThree(bean.getOptionThree());
        entity.setOptionFour(bean.getOptionFour());
        entity.setAnswer(bean.getAnswer());
        entity.setLearn(bean.getLearn());
        return entity;
    }

    @Override
    protected DailyTestBean createBean(DailyTest entity) {
        DailyTestBean bean = new DailyTestBean();
        bean.setId(entity.getId());
        bean.setQuestion(entity.getQuestion());
        bean.setOptionOne(entity.getOptionOne());
        bean.setOptionTwo(entity.getOptionTwo());
        bean.setOptionThree(entity.getOptionThree());
        bean.setOptionFour(entity.getOptionFour());
        bean.setAnswer(entity.getAnswer());
        bean.setLearn(entity.getLearn());
        return bean;
    }
}
