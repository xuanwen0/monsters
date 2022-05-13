package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.orm.jpa.HibernateJpaAutoConfiguration;
import org.springframework.context.annotation.Bean;

@SpringBootApplication()
public class MonstersApplication {
	public static void main(String[] args) {
		SpringApplication.run(MonstersApplication.class, args);
	}

}
