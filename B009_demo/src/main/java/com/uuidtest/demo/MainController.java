package com.uuidtest.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.uuidtest.demo.file.FileService;
import com.uuidtest.demo.file.FileVO;
import com.uuidtest.demo.member.MemberDAO;
import com.uuidtest.demo.member.MemberVO;

@Controller
public class MainController {
    
    @Value("${file.upload-dir}") // 괄호에 있는 config가 있나보네! 내부적으로 Getter를 호출
    private String uploadDir;

    @Autowired
    FileService fileService;

    @Autowired
    MemberDAO memberDAO;

    @GetMapping("/join")
    public String join() {
        System.out.println("uploadDir: " + uploadDir);
        return "join";
    }

    @PostMapping("/join")
    public ResponseEntity<String> join(@ModelAttribute("MemberVO") MemberVO vo) throws Exception {

        FileVO fileVO = null;

        // 파일을 전송받았다면 파일을 저장하고 FILE_TBL에 insert한다.
        if (vo.getThumbnail() != null) {
            // FileVO 설정
            fileVO = new FileVO();
            fileVO.setMultiFile(vo.getThumbnail());
            fileVO.setFilePath(uploadDir + "member/thumbnail");

            // 파일에 저장하고 FILE_TBL에 해당 정보를 저장한다.
            fileVO = fileService.createFile(fileVO);
            fileService.insertFileTbl(fileVO);

            // MemberVO에 fileCode를 설정해준다.
            vo.setFileCode(fileVO.getFileCode());
        }
        // 회원가입 쿼리를 실행한다.
        memberDAO.insertMemberTbl(vo);

        return new ResponseEntity<String>("JOIN_SUCCESS", HttpStatus.OK);
    }
}
