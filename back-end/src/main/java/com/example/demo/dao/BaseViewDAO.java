package com.example.demo.dao;

import com.example.demo.dto.Page;
import org.hibernate.criterion.DetachedCriteria;

import java.io.Serializable;
import java.util.List;
import java.util.Optional;

public interface BaseViewDAO<V> {
	int DEFAULT_PAGE_DATA_COUNT = 20;

	Optional<V> getByEntity(V entity);

	Optional<V> getByPK(Serializable pk);

	List<V> searchByEntity(V entity);
	List<V> searchByEntity(V entity, Page page) ;

	List<V> searchAll();

	List<V> searchAll(Page page);

	int getCount(DetachedCriteria detachedCriteria);
}
