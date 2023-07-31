package com.uuidtest.demo.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

@Configuration // 사용자가 만든 config가 있구나! 프로퍼티를 탐색해보자!
public class FileUploaderConfig {
    
    @Value("${file.upload-dir}") // 롬복이 아닌 context 어노테이션임에 유의~
    private String uploadDir;

    public String getUploadDir() {
        return uploadDir;
    }
}
