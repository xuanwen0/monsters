package com.example.demo.service;

import com.example.demo.bean.BaseBean;
import com.example.demo.dto.Page;

import java.io.Serializable;
import java.util.List;
import java.util.Optional;

public interface BaseViewService<B extends BaseBean> {
	Optional<B> getByBean(B bean);

	Optional<B> getByPK(Serializable id) ;

	List<B> searchByBean(B bean) ;

	List<B> searchByBean(B bean, Page page) ;

	List<B> searchAll() ;

	List<B> searchAllWithPage(Page page) ;
}
