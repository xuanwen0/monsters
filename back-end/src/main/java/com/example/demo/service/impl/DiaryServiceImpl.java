package com.example.demo.service.impl;

import com.example.demo.bean.DiaryBean;
import com.example.demo.dao.DiaryDAO;
import com.example.demo.entity.Diary;
import com.example.demo.service.DiaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DiaryServiceImpl extends BaseServiceImplement<DiaryDAO, Diary, DiaryBean> implements DiaryService {

    @Autowired
    private final DiaryDAO diaryDAO;

    public DiaryServiceImpl(DiaryDAO baseDAO) {
        super(baseDAO);
        this.diaryDAO = baseDAO;
    }

    @Override
    public DiaryBean createAndReturnBean(DiaryBean bean) {
        return null;
    }
    public List<Diary> find(){
        return diaryDAO.searchAll();
    }

    @Override
    protected Diary createVO(DiaryBean bean) {
        Diary entity = new Diary();
        entity.setId(bean.getId());
        entity.setAccount(bean.getAccount());
        entity.setContent(bean.getContent());
        entity.setIndex(bean.getIndex());
        entity.setUpdate_date(bean.getUpdate_date());
        entity.setShare(bean.getShare());
        return entity;
    }

    @Override
    protected DiaryBean createBean(Diary entity) {
        DiaryBean bean = new DiaryBean();
        bean.setId(entity.getId());
        bean.setAccount(entity.getAccount());
        bean.setContent(entity.getContent());
        bean.setIndex(entity.getIndex());
        bean.setUpdate_date(entity.getUpdate_date());
        bean.setShare(entity.getShare());
        return bean;
    }
}
