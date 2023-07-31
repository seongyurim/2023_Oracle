package com.uuidtest.demo.member;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@Data
public class MemberVO {    
    private String memberId;
    private String memberPw;
    private String name;
    private String email;
    private String fileCode;

    @JsonIgnore
    private MultipartFile thumbnail;
}
