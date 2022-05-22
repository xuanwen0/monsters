package com.example.demo.dao.impl;

import com.example.demo.dao.BaseViewDAO;
import com.example.demo.dto.Page;
import com.example.demo.utility.VOWrapperUtility;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;
import org.springframework.dao.support.DataAccessUtils;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.util.Assert;

import javax.annotation.Resource;
import java.beans.PropertyDescriptor;
import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.*;
import java.util.stream.Collectors;

public class BaseViewDAOImplement<V> extends HibernateDaoSupport implements BaseViewDAO<V> {
	static final String notNullMessage = "template不能為null";

	protected List<Criterion> criterion = new ArrayList<>();

	private Class<V> entityClass;

	@Resource(name = "sessionFactory")
	public void setSuperSessionFactory(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}

	@SuppressWarnings("unchecked")
	public BaseViewDAOImplement() {
		entityClass = (Class<V>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
	}

	@Override
	public Optional<V> getByEntity(V entity) {
		return getOne(searchByEntity(entity));
	}

	Optional<V> getOne(DetachedCriteria detachedCriteria) {
		return getOne(findByCriteria(detachedCriteria));
	}

	Optional<V> getOne(List<V> entityList) {
		if (entityList.size() == 1) {
			return Optional.of(entityList.get(0));
		}
		return Optional.empty();
	}

	@Override
	public Optional<V> getByPK(Serializable pk) {
		Assert.notNull(getHibernateTemplate(), notNullMessage);
		return Optional.ofNullable(getHibernateTemplate().get(entityClass, pk));
	}

	@Override
	public List<V> searchByEntity(V entity) {
		return searchByEntity(entity, Page.infinite());
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<V> searchByEntity(V entity, Page page) {
		try {
			List<String> aliasList = new ArrayList<>();
			DetachedCriteria detachedCriteria = DetachedCriteria.forClass(entityClass);
			VOWrapperUtility<V> wrapper = new VOWrapperUtility<>(entity);
			for (PropertyDescriptor propertyDescriptor : wrapper.getNotNullFieldList()) {
				if (wrapper.isJoinColumn(propertyDescriptor.getName())) {
					VOWrapperUtility aliasWrapper = new VOWrapperUtility(wrapper.getPropertyValue(propertyDescriptor));
					for (Object aliasFieldObject : aliasWrapper.getNotNullFieldList()) {
						PropertyDescriptor aliasField = (PropertyDescriptor) aliasFieldObject;
						String aliasFieldName = aliasField.getName();
						if (!aliasList.contains(aliasFieldName)) {
							aliasList.add(aliasFieldName);
							detachedCriteria.createAlias(aliasFieldName, aliasFieldName, JoinType.INNER_JOIN);
						}
						detachedCriteria.add(Restrictions.eq(propertyDescriptor.getName() + "." + aliasFieldName,
								aliasWrapper.getPropertyValue(aliasField)));
					}
				} else if (wrapper.isBasicColumn(propertyDescriptor.getName())) {
					detachedCriteria.add(Restrictions.eq(propertyDescriptor.getName(),
							wrapper.getPropertyValue(propertyDescriptor)));
				}
			}
			return findByCriteria(detachedCriteria, page);
		} catch (Exception e) {
			return Collections.emptyList();
		}
	}

	protected List<V> findByCriteria(DetachedCriteria detachedCriteria) {
		return findByCriteria(detachedCriteria, Page.infinite());
	}

	@SuppressWarnings("unchecked")
	protected List<V> findByCriteria(DetachedCriteria detachedCriteria, Page page) {
		Assert.notNull(getHibernateTemplate(), notNullMessage);
		if (page.isInfinite()) {
			return (List<V>) getHibernateTemplate().findByCriteria(detachedCriteria);
		} else {
			return (List<V>) getHibernateTemplate().findByCriteria(detachedCriteria, page.getFirstResultIndex(),
					page.getCount());
		}
	}

	@Override
	public List<V> searchAll() {
		Assert.notNull(getHibernateTemplate(), notNullMessage);
		return getHibernateTemplate().loadAll(entityClass);
	}

	@Override
	public List<V> searchAll(Page page) {
		return searchAll().stream().skip(page.getFirstResultIndex()).limit(page.getCount())
				.collect(Collectors.toList());
	}

	@Override
	public int getCount(DetachedCriteria detachedCriteria) {
		Assert.notNull(getHibernateTemplate(), notNullMessage);
		detachedCriteria.setProjection(Projections.rowCount());
		return DataAccessUtils.intResult(findByCriteria(detachedCriteria));
	}

	protected boolean isEmpty(Object object) {
		return !isNotEmpty(object);
	}

	protected boolean isNotEmpty(Object object) {
		if (object == null) {
			return false;
		}
		if (object instanceof Character) {
			Character temp = (Character) object;
			return !Character.isSpaceChar(temp);
		} else if (object instanceof String) {
			String temp = (String) object;
			return StringUtils.isNotBlank(temp);
		} else if (object instanceof Byte) {
			Byte temp = (Byte) object;
			return temp != 0;
		} else if (object instanceof Short) {
			Short temp = (Short) object;
			return temp != 0;
		} else if (object instanceof Integer) {
			Integer temp = (Integer) object;
			return temp != 0;
		} else if (object instanceof Long) {
			Long temp = (Long) object;
			return temp != 0;
		} else if (object instanceof Float) {
			Float temp = (Float) object;
			return temp != 0.0;
		} else if (object instanceof Double) {
			Double temp = (Double) object;
			return temp != 0.0;
		} else if (object instanceof Collection) {
			Collection temp = (Collection) object;
			return !temp.isEmpty();
		} else {
			return true;
		}
	}
}
