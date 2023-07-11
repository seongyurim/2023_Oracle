package com.study.di.beans;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class Config {

    // 로그인 인스턴스를 만들어서 리턴
    @Bean("MemberLogin")
    public Login getLoginInstance() {
        return new Login();
    }
    
}
