package com.example.demo.service.impl;

import com.example.demo.bean.BaseBean;
import com.example.demo.dao.BaseViewDAO;
import com.example.demo.dto.Page;
import com.example.demo.service.BaseViewService;
import com.example.demo.utility.BeanUtility;
import org.springframework.util.Assert;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public abstract class BaseViewServiceImplement<D extends BaseViewDAO<V>, V, B extends BaseBean>
		implements BaseViewService<B> {
	D baseDAO;

	public BaseViewServiceImplement(D d) {
		Assert.notNull(d, "baseDAO不能為null");
		this.baseDAO = d;
	}

	List<V> createVOList(List<B> bList) {
		List<V> voList = new ArrayList<>();
		if (bList == null) {
			return voList;
		}
		for (B b : bList) {
			V vo = createVO(b);
			voList.add(vo);
		}
		return voList;
	}

	protected abstract V createVO(B b);

	List<B> createBeanList(List<V> vList) {
		List<B> beanList = new ArrayList<>();
		if (vList == null) {
			return beanList;
		}
		for (V v : vList) {
			B bean = createBean(v);
			beanList.add(bean);
		}
		return beanList;
	}

	protected abstract B createBean(V v);

	@Override
	public Optional<B> getByBean(B b) {
		if (b == null) {
			return Optional.empty();
		}
		Optional<V> optional = baseDAO.getByEntity(createVO(b));
		if (optional.isPresent()) {
			V entity = optional.get();
			return Optional.of(createBean(entity));
		}
		return Optional.empty();
	}

	@Override
	public Optional<B> getByPK(Serializable pk) {
		Optional<V> optional = baseDAO.getByPK(pk);
		if (optional.isPresent()) {
			V entity = optional.get();
			B bean = createBean(entity);
			return Optional.of(bean);
		} else {
			return Optional.empty();
		}
	}

	@Override
	public List<B> searchByBean(B b) {
		return createBeanList(baseDAO.searchByEntity(createVO(b)));
	}

	@Override
	public List<B> searchByBean(B b, Page page) {
		return createBeanList(baseDAO.searchByEntity(createVO(b), page));
	}

	@Override
	public List<B> searchAll() {
		return createBeanList(baseDAO.searchAll());
	}

	@Override
	public List<B> searchAllWithPage(Page page) {
		return createBeanList(baseDAO.searchAll(page));
	}

	protected void copy(Object from, Object to) {
		if (from != null && to != null) {
			BeanUtility.copyProperties(from, to);
		}
	}

}
