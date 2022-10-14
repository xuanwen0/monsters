package com.example.demo.dao;

import com.example.demo.entity.MindGame;

import java.util.List;

public interface MindGameDAO extends BaseDAO<MindGame> {
    List<MindGame> findById(Integer id);
}
