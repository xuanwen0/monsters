package com.example.demo.service.impl;

import com.example.demo.bean.MindGameBean;
import com.example.demo.dao.MindGameDAO;
import com.example.demo.entity.MindGame;
import com.example.demo.service.MindGameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class MindGameServiceImpl extends BaseServiceImplement<MindGameDAO, MindGame, MindGameBean> implements MindGameService {
    @Autowired
    private final MindGameDAO mindGameDAO;

    public MindGameServiceImpl(MindGameDAO baseDAO) {
        super(baseDAO);
        this.mindGameDAO = baseDAO;
    }

    @Override
    public MindGameBean createAndReturnBean(MindGameBean bean) {
        return null;
    }
    public List<MindGame> find(){
        return mindGameDAO.searchAll();
    }


    public List<MindGameBean> searchMindGame(){
        List<MindGame> gameList = mindGameDAO.searchAll();
        List<MindGameBean> mindGameBeanList = new ArrayList<>();
        for(MindGame mindGame : gameList){
            mindGameBeanList.add(createBean(mindGame));
        }
        return mindGameBeanList;
    }

    @Override
    protected MindGame createVO(MindGameBean bean) {
        MindGame entity = new MindGame();
        entity.setId(bean.getId());
        entity.setName(bean.getName());
        entity.setWeb(bean.getWeb());
        return entity;
    }


    @Override
    protected MindGameBean createBean(MindGame entity) {
        MindGameBean bean = new MindGameBean();
        bean.setId(entity.getId());
        bean.setName(entity.getName());
        bean.setWeb(entity.getWeb());
        return bean;
    }
}
