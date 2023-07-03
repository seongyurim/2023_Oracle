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

    @PostMapping("/loginProc")
    public String loginProc(String userId, String userPw)
    {
        System.out.println("id : " + userId);
        System.out.println("pw : " + userPw);
        return "hello";
    }
    
}
