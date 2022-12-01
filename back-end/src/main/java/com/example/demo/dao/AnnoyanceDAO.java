package com.example.demo.dao;

import com.example.demo.entity.Annoyance;

import java.util.List;

public interface AnnoyanceDAO extends BaseDAO<Annoyance> {
    List<Annoyance> findByAccount(String account);
    List<Annoyance> findByShare();

    List<Annoyance> findBySolve(int solve, String account);

    List<Annoyance>  findByShareByAccount(String account);

}