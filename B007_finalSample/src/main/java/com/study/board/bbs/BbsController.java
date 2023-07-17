package com.study.board.bbs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class BbsController {

    @Autowired
    BbsDAO bbsDAO;
    
    @PostMapping("/bbs/list")
    @ResponseBody // divi, page, rosPerPage
    public BbsMstVO bbsList(@ModelAttribute("BbsTblVO") BbsTblVO vo) throws Exception {
        BbsMstVO bbsMstVO = new BbsMstVO();
        // System.out.println(vo.getDivi());
        // System.out.println(vo.getPage());
        // System.out.println(vo.getRowsPerPage());

        // 1. 전체 row의 개수를 가지고 온다.
        int rowCount = bbsDAO.selectBbsRowCount();
        // System.out.println("rowCount = " + rowCount);

        // 2. 페이지에 해당하는 BBS 데이터를 가지고 온다.
        List<BbsTblVO> list = bbsDAO.selectBbsList(vo);

        // 3. BbsMstVO에 저장하고 전송한다.
        bbsMstVO.setRowCount(rowCount);
        bbsMstVO.setBbsList(list);

        // 4. 결과를 반환한다.
        return bbsMstVO;        
    }

}
