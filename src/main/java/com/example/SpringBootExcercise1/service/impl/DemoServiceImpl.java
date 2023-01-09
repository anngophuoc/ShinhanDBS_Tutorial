package com.example.SpringBootExcercise1.service.impl;
import com.example.SpringBootExcercise1.service.DemoService;
import org.springframework.stereotype.Service;
import com.example.SpringBootExcercise1.repository.DemoRepository;

@Service
public class DemoServiceImpl implements DemoService {
    private DemoRepository demoRepository;
    public DemoServiceImpl(DemoRepository demoRepository)
    {
        this.demoRepository = demoRepository;
    }

    @Override
    public String getHelloWorld(){
        String getHelloString = demoRepository.getHelloWorld();
        return getHelloString;
    }
}
