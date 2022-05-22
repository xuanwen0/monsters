package com.example.demo.dao.impl;

import com.example.demo.dao.AnnoyanceDAO;
import com.example.demo.dto.Page;
import com.example.demo.entity.Annoyance;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.List;
import java.util.Optional;

@Repository
public class AnnoyanceDAOImpl extends BaseDAOImplement implements AnnoyanceDAO {

    @Override
    public List<Annoyance> findByAccount(String account) {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Annoyance.class);
        detachedCriteria.add(Restrictions.eq("account", account));
        return findByCriteria(detachedCriteria);
    }
}


