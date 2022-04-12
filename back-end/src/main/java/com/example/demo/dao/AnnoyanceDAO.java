package com.example.demo.dao;

import com.example.demo.entity.Annoyance;
import org.springframework.data.repository.CrudRepository;

public interface AnnoyanceDAO extends CrudRepository<Annoyance, Integer> {
}