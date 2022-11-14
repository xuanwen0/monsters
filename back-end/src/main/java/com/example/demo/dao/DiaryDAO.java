package com.example.demo.dao;

import com.example.demo.entity.Diary;

import java.util.List;

public interface DiaryDAO extends BaseDAO<Diary> {
    List<Diary> findByAccount(String account);
    List<Diary> findByShare();
}
