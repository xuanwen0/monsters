package com.example.demo.service.impl;

import com.example.demo.bean.AnswerBookBean;
import com.example.demo.dao.AnswerBookDAO;
import com.example.demo.entity.AnswerBook;
import com.example.demo.service.AnswerBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AnswerBookServiceImpl extends BaseServiceImplement<AnswerBookDAO, AnswerBook, AnswerBookBean> implements AnswerBookService {
    @Autowired
    private final AnswerBookDAO answerBookDAO;

    public AnswerBookServiceImpl(AnswerBookDAO baseDAO) {
        super(baseDAO);
        this.answerBookDAO = baseDAO;
    }

    @Override
    public AnswerBookBean createAndReturnBean(AnswerBookBean bean) {
        return null;
    }

    protected AnswerBook createVO(AnswerBookBean bean) {
        AnswerBook entity = new AnswerBook();
        entity.setId(bean.getId());
        entity.setContent(bean.getContent());
        return entity;
    }

    protected AnswerBookBean createBean(AnswerBook entity) {
        AnswerBookBean bean = new AnswerBookBean();
        bean.setId(entity.getId());
        bean.setContent(entity.getContent());
        return bean;
    }
}
