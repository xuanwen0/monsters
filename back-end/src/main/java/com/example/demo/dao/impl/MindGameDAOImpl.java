package com.example.demo.dao.impl;

import com.example.demo.dao.MindGameDAO;
import com.example.demo.entity.Annoyance;
import com.example.demo.entity.MindGame;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MindGameDAOImpl extends BaseDAOImplement<MindGame> implements MindGameDAO {

}
