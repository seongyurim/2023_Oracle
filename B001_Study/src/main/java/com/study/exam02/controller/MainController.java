package com.study.exam02.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MainController {

    @GetMapping("/hello")
    public String hello()
    {
        System.out.println("Receive Hello Get Request!");
        return "hello";
    }

    @GetMapping("/login")
    public String login()
    {
        return "login";
    }

    @PostMapping("/login")
    public String login(String userId, String userPw)
    {
        System.out.println("id : " + userId);
        System.out.println("pw : " + userPw);
        return "hello";
    }

    @GetMapping("/exam")
    public String exam()
    {
        return "exam";
    }

    @GetMapping("/exam01_date")
    public String exam01_date()
    {
        return "exam01_date";
    }

    @GetMapping("/exam02_try")
    public String exam02_try()
    {
        return "exam02_try";
    }

    @GetMapping("/exam03_gugudan")
    public String exam03_gugudan()
    {
        return "exam03_gugudan";
    }

    @GetMapping("/exam04_request")
    public String exam04_request()
    {
        return "exam04_request";
    }

    @GetMapping("/exam04_request_info")
    public String exam04_request_info()
    {
        return "exam04_request_info";
    }

    @PostMapping("/exam04_request_info")
    public String exam04_request_info_post()
    {
        return "exam04_request_info";
    }

    @PostMapping("/exam04_request_value")
    public String exam04_request_value()
    {
        return "exam04_request_value";
    }
    
}
