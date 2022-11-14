package com.example.demo.service.impl;

import com.example.demo.bean.ThemeBean;
import com.example.demo.dao.ThemeDAO;
import com.example.demo.entity.Theme;
import com.example.demo.service.ThemeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ThemeServiceImpl extends BaseServiceImplement<ThemeDAO, Theme, ThemeBean> implements ThemeService {
    @Autowired
    private final ThemeDAO themeDAO;

    public ThemeServiceImpl(ThemeDAO baseDAO) {
        super(baseDAO);
        this.themeDAO = baseDAO;
    }

    @Override
    public ThemeBean createAndReturnBean(ThemeBean bean) {
        return null;
    }

    public List<Theme> find(){
        return themeDAO.searchAll();
    }


    @Override
    protected Theme createVO(ThemeBean bean) {
        Theme entity = new Theme();
        entity.setId(bean.getId());
        entity.setColorNumber(bean.getColorNumber());
        return entity;
    }

    @Override
    protected ThemeBean createBean(Theme entity) {
        ThemeBean bean = new ThemeBean();
        bean.setId(entity.getId());
        bean.setColorNumber(entity.getColorNumber());
        return bean;
    }
}
