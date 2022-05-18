package com.example.demo.dao.impl;

import com.example.demo.dao.BaseDAO;
import org.springframework.data.repository.NoRepositoryBean;
import org.springframework.util.Assert;

import java.io.Serializable;

@NoRepositoryBean
public abstract class BaseDAOImplement<V> extends BaseViewDAOImplement<V> implements BaseDAO<V> {

	public BaseDAOImplement() {
		super();
	}

	@Override
	public void insert(V entity) {
		Assert.notNull(this.getHibernateTemplate(), notNullMessage);
		this.getHibernateTemplate().save(entity);
		this.getHibernateTemplate().flush();
	}

	@Override
	public Serializable insertAndReturnPK(V entity) {
		Assert.notNull(this.getHibernateTemplate(), notNullMessage);
		Serializable serializable = this.getHibernateTemplate().save(entity);
		this.getHibernateTemplate().flush();
		return serializable;
	}

	@Override
	public void update(V entity) {
		Assert.notNull(this.getHibernateTemplate(), notNullMessage);
		this.getHibernateTemplate().update(entity);
		this.getHibernateTemplate().flush();
	}

	@Override
	public void delete(V entity) {
		Assert.notNull(this.getHibernateTemplate(), notNullMessage);
		this.getHibernateTemplate().delete(entity);
	}
}
