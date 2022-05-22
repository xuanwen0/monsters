package com.example.demo.dao;

import java.io.Serializable;

public interface BaseDAO<V> extends BaseViewDAO<V> {
	void insert(V entity);

	Serializable insertAndReturnPK(V entity);

	void update(V entity);

	void delete(V entity);



}
