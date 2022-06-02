package com.example.demo.dao.impl;

import com.example.demo.entity.Annoyance;
import com.example.demo.dao.AnnoyanceDAO;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AnnoyanceDAOImpl extends BaseDAOImplement<Annoyance> implements AnnoyanceDAO {

    @Override
    public List<Annoyance> findByAccount(String account) {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Annoyance.class);
        detachedCriteria.add(Restrictions.eq("account", account));
        return findByCriteria(detachedCriteria);
    }
}


