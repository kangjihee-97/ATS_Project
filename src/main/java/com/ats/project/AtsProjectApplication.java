package com.ats.project;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@MapperScan("com.ats.project.dao")
@EnableScheduling                    // ← 자동 마감 스케줄러
public class AtsProjectApplication {
    public static void main(String[] args) {
        SpringApplication.run(AtsProjectApplication.class, args);
    }
}