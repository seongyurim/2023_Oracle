package com.study.board.bbs;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.board.common.SessionUtil;
import com.study.board.user.UserTblVO;


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

    @GetMapping("/bbs/content")
    public String content(@ModelAttribute("BbsTblVO") BbsTblVO vo,
                          Model model) throws Exception {
        // vo로 userId, seq 값을 받았다.

        // SELECT * FROM BBS_TBL WHERE USERID='jsh' AND QEQ=1
        BbsTblVO resultVO = bbsDAO.selectBbsContent(vo);

        // 게시글 작성자와 사용자가 동일하다면 게시글을 수정할 수 있어야 한다.
        // 따라서 로그인 된 회원 세션이 필요하다.
        UserTblVO userTblVO = (UserTblVO)SessionUtil.getAttribute("USER");

        // 모델에 담는다.
        model.addAttribute("vo", resultVO);    // content row 정보 보내기
        model.addAttribute("session", userTblVO); // 로그인한 유저의 정보 보내기

        return "/bbs/content";
    }

    @PostMapping("/bbs/content")
    @ResponseBody // HTTP의 body(payload)로 응답하겠다는 의미(모델, 뷰를 거치지 않고)
    public String content(@ModelAttribute("BbsTblVO") BbsTblVO vo) throws Exception {
        // vo로 id, seq, title, content를 받았다.
        System.out.println(vo.getUserId());
        System.out.println(vo.getSeq());
        System.out.println(vo.getTitle());
        System.out.println(vo.getContent());

        int updateCount = bbsDAO.updateBbsContent(vo);
        // 반드시 1이어야 한다.
        // 키를 가지고 업데이트한 것이기 때문이다.

        if (updateCount == 1) {
            return "OK";
        }
        else {
            return "FAIL";
        }
    }

    @PostMapping("/bbs/newcontent")
    public String newcontent(@ModelAttribute("BbsTblVO") BbsTblVO vo,
                             HttpServletRequest request,
                             HttpServletResponse response) throws Exception {
        System.out.println(vo.getUserId()); // 이제 출력될 것입니다.
        System.out.println(vo.getSeq()); // 이제 출력될 것입니다.
        System.out.println(vo.getTitle());
        System.out.println(vo.getContent());
        System.out.println(vo.getDivi());
        System.out.println(vo.getRegdate()); // 이제 출력될 것입니다.
        
        // 필요한 로직 수행
        
        return "bbs/newcontent";
    }


}
