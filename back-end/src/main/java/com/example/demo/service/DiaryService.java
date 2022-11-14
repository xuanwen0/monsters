package com.example.demo.service;

import com.example.demo.bean.DiaryBean;

import java.util.List;

public interface DiaryService extends BaseService<DiaryBean> {
    List<DiaryBean> searchAnnoyanceByAccount(String account);

    List<DiaryBean> searchAnnoyanceByShare();
}
