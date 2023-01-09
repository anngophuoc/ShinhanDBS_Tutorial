package com.example.SpringBootExcercise1.repository;

import org.springframework.stereotype.Repository;

@Repository
public class DemoRepository {
    public String getHelloWorld()
    {
        return "Hello World!";
    }
}
