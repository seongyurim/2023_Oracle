package com.study.di.beans;

public class Login implements Loginable {
    
    public boolean login(String id, String pw) {

        System.out.println("데이터베이스 연결 완료");
        System.out.println("SELECT * FROM USER_TBL WHERE userid=" + id + " AND userpw=" + pw);
        return true;
    }
}
