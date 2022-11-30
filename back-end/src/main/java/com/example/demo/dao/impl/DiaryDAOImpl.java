package com.example.demo.dao.impl;

import com.example.demo.dao.DiaryDAO;
import com.example.demo.entity.Diary;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class DiaryDAOImpl extends BaseDAOImplement<Diary> implements DiaryDAO {
    @Override
    public List<Diary> findByAccount(String account) {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Diary.class);
        detachedCriteria.add(Restrictions.eq("account", account));
        return findByCriteria(detachedCriteria);
    }

    @Override
    public List<Diary> findByShare() {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Diary.class);
        detachedCriteria.add(Restrictions.eq("share", 1));
        return findByCriteria(detachedCriteria);
    }

    @Override
    public List<Diary> findByShareByAccount(String account) {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Diary.class);
        detachedCriteria.add(Restrictions.eq("share", 1));
        detachedCriteria.add(Restrictions.eq("account", account));
        return findByCriteria(detachedCriteria);
    }
}
