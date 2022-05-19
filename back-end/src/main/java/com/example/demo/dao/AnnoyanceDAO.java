package com.example.demo.dao;

import com.example.demo.entity.Annoyance;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

public interface AnnoyanceDAO extends JpaRepository<Annoyance, Integer> {
}