package com.study.board.bbs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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

        return mstvo;    
    }

    @GetMapping("/bbs/content")
    public String viewContent(@ModelAttribute("BbsTblVO") BbsTblVO vo, Model model) throws Exception
    {
        // 1. 함수에 알맞은 파라미터를 넣는다.

        // 2. 쿼리를 DB에 전송하여 결과를 가져온다.
        // SELECT * FROM BBS_TBL WHERE userid='jsh AND seq='1';
        BbsTblVO resultVO = bbsDao.selectBbsContent(vo);
        
        // 3. 결과를 가지고 JSP를 만들어서 보내준다.
        model.addAttribute("vo", resultVO);

        return "bbs/content";
    }
}