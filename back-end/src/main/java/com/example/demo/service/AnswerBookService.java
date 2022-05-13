package com.example.demo.service;

import com.example.demo.bean.AnswerBookBean;
import com.example.demo.dao.AnswerBookDAO;
import com.example.demo.entity.AnswerBook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AnswerBookService {
    @Autowired
    private final AnswerBookDAO answerBookDAO;

    public AnswerBookService(AnswerBookDAO answerBookDAO) {
        this.answerBookDAO = answerBookDAO;
    }

    public List<AnswerBook> find(){
        return answerBookDAO.findAll();
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
