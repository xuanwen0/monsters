package com.example.demo.service.impl;

import com.example.demo.bean.AnnoyanceTypeBean;
import com.example.demo.dao.AnnoyanceTypeDAO;
import com.example.demo.entity.AnnoyanceType;
import com.example.demo.service.AnnoyanceTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AnnoyanceTypeServiceImpl extends BaseServiceImplement<AnnoyanceTypeDAO, AnnoyanceType, AnnoyanceTypeBean> implements AnnoyanceTypeService {

    @Autowired
    private final AnnoyanceTypeDAO annoyanceTypeDAO;

    public AnnoyanceTypeServiceImpl(AnnoyanceTypeDAO baseDAO) {
        super(baseDAO);
        this.annoyanceTypeDAO = baseDAO;
    }

    @Override
    public AnnoyanceTypeBean createAndReturnBean(AnnoyanceTypeBean bean) {
        return null;
    }
    public List<AnnoyanceType> find(){
        return annoyanceTypeDAO.searchAll();
    }


    @Override
    protected AnnoyanceType createVO(AnnoyanceTypeBean bean) {
        AnnoyanceType entity = new AnnoyanceType();
        entity.setId(bean.getId());
        entity.setValue(bean.getValue());
        return entity;
    }

    @Override
    protected AnnoyanceTypeBean createBean(AnnoyanceType entity) {
        AnnoyanceTypeBean bean = new AnnoyanceTypeBean();
        bean.setId(entity.getId());
        bean.setValue(entity.getValue());
        return bean;
    }
}
