package com.example.demo.dao.impl;

import com.example.demo.dao.PersonalInfoDAO;
import com.example.demo.entity.Annoyance;
import com.example.demo.entity.PersonalInfo;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PersonalInfoDAOImpl extends BaseDAOImplement<PersonalInfo> implements PersonalInfoDAO {
    @Override
    public List<PersonalInfo> findByAccount(String account) {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(PersonalInfo.class);
        detachedCriteria.add(Restrictions.eq("account", account));
        return findByCriteria(detachedCriteria);
    }
}