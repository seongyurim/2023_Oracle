package com.uuidtest.demo.file;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service // 객체를 스프링부트가 직접 생성
public class FileService {

    @Autowired
    FileDAO fileDAO;
    
    public FileVO createFile(FileVO vo) throws Exception {

        UUID uuid;          // UUID
        String fileCode;    // 파일코드
        String fileExt;     // 파일확장자
        String orgFileName;

        if (false == vo.getMultiFile().getOriginalFilename().isEmpty()) {
            // 여기로 들어오면 파일이 존재한다는 의미

            // fileCode를 만든다.
            uuid = UUID.randomUUID();
            fileCode = uuid.toString().replaceAll("-", "");

            // storedName을 만든다.
            orgFileName = vo.getMultiFile().getOriginalFilename();
            fileExt = orgFileName.substring(orgFileName.lastIndexOf("."), orgFileName.length());
            
            // System.out.println(fileCode);
            // System.out.println(fileExt);

            // FileVO를 설정한다.
            vo.setFileCode(fileCode);
            vo.setStoredName(fileCode + fileExt);
            vo.setOriginName(orgFileName);

            // 파일을 vo에 맞게 최종저장한다.
            FileUtil.saveFile(vo);
        }
        return vo;
    }

    public int insertFileTbl(FileVO vo) throws Exception {
        return fileDAO.insertFileTbl(vo);
    }
}
