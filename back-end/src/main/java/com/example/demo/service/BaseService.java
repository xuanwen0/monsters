package com.example.demo.service;

import com.example.demo.bean.BaseBean;

import java.io.Serializable;

public interface BaseService<B extends BaseBean> extends BaseViewService<B> {
	B createAndReturnBean(B bean) ;

	void update(Serializable id, B bean);

	void delete(Serializable id);
}
