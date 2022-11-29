package com.example.demo.service.impl;

import com.example.demo.bean.BaseBean;
import com.example.demo.dao.BaseDAO;
import com.example.demo.service.BaseService;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.Optional;

public abstract class BaseServiceImplement<D extends BaseDAO<V>, V, B extends BaseBean>
		extends BaseViewServiceImplement<D, V, B> implements BaseService<B> {
	public BaseServiceImplement(D baseDAO) {
		super(baseDAO);
	}

	@Override
	@Transactional(readOnly = false)
	public void update(Serializable pk, B bean) {
		try {
			Optional<V> optional = baseDAO.getByPK(pk);
			if (optional.isPresent()) {
				V entity = optional.get();
				copy(bean, entity);
				baseDAO.update(entity);
			} else {
				throw new Exception("找不到資料, pk = " + pk);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	@Override
	public void delete(Serializable pk) {
		try {
			Optional<V> optional = baseDAO.getByPK(pk);
			if (optional.isPresent()) {
				V entity = optional.get();
				baseDAO.delete(entity);
			} else {
				throw new Exception("找不到資料, pk = " + pk);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}


}
