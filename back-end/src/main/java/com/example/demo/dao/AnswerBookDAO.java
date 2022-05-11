package com.example.demo.dao;

import com.example.demo.entity.AnswerBook;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

public interface AnswerBookDAO extends JpaRepository<AnswerBook, Integer> {
}
