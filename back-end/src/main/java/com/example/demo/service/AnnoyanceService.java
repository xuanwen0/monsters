package com.example.demo.service;

import com.example.demo.bean.AnnoyanceBean;

import java.util.List;

/**
 * @author linwe
 */
public interface AnnoyanceService extends BaseService<AnnoyanceBean>{
    List<AnnoyanceBean> searchAnnoyanceByAccount(String account);
}
