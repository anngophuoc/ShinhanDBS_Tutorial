package com.example.SpringBootExcercise1.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import com.example.SpringBootExcercise1.service.DemoService;

@RestController
public class DemoController {
    private final DemoService demoService;

    public DemoController(DemoService demoService) {
        this.demoService = demoService;
    }
    @GetMapping(value = "/")
    public String getDemo(){
        return demoService.getHelloWorld();
    }
}
