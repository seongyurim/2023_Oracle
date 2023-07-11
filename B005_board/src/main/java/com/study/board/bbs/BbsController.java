package com.study.board.bbs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BbsController {

    @Autowired // 의존성 주입
    BbsDAO bbsDao;
    
    @PostMapping("/bbs/list")
    @ResponseBody // HTTP body영역을 의미. body로 응답하겠다.
    public BbsMstVO dataBbslist(@ModelAttribute("BbsTblVO") BbsTblVO vo) throws Exception {
        
        BbsMstVO mstvo = new BbsMstVO();

        // 쿼리를 전송하여 결과를 가지고 온다.
        List<BbsTblVO> list = bbsDao.selectBbsList(vo);

        // 결과를 mstvo에 저장하고, 이것을 클라이언트에게 전송한다.
        mstvo.setBbsList(list);

        return mstvo; // 내가 응답할 패킷의 Body에 응답할 내용을 써서 전달?
    
    }
}