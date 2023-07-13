package com.study.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.study.board.common.SessionUtil;
import com.study.board.user.UserDAO;
import com.study.board.user.UserTblVO;

@Controller
public class MainController {

    @Autowired // 의존성을 주입시키는 어노테이션
    UserDAO userDAO;
    
    @GetMapping("/index")
    public String index(Model model) throws Exception {
        // 1. 요청한 주체에게 세션(사용자 정보)이 존재하는가?
        UserTblVO userTblVO = (UserTblVO)SessionUtil.getAttribute("USER");

        // 2. 만약에 세션이 존재한다면 Model에 사용자 정보를 저장하여 index.jsp로 전송한다.
        if (userTblVO != null) {
            model.addAttribute("vo", userTblVO);
        }
        return "index";
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    // 아이디, 패스워드를 넘겨서 로그인을 실제로 처리해달라는 요청
    @PostMapping("/login")
    public void login(@ModelAttribute("UserTblVO") UserTblVO vo,
                      HttpServletRequest request,
                      HttpServletResponse response) throws Exception {

        // 오라클에 쿼리를 전송해서 결과를 받아와야 한다.
        // 따라서 그 작업을 수행할 DAO가 필요하다.
        UserTblVO resultVO = userDAO.selectOneUser(vo);

        if (resultVO == null) {
            // 등록된 사용자가 아닌 경우
            System.out.println("등록된 사용자가 아닙니다.");
            response.sendRedirect("login");

        } else {
            // 등록되어 있는 사용자인 경우
            System.out.println("사용자입니다.");
            System.out.println(resultVO);
            SessionUtil.set(request, "USER", resultVO);
            response.sendRedirect("index");
        }
    }

    @GetMapping("/logout")
    public void logout(HttpServletRequest request,
                       HttpServletResponse response) throws Exception {
        // 로그아웃으로 왔다는 것은 현재 로그인이 되어있다는 의미
        // 즉 세션에 사용자 정보가 존재한다는 의미이므로 세션을 비워야 한다.
        SessionUtil.remove(request, "USER");
        response.sendRedirect("index"); // 세션이 비워진 채로 index()로 이동
    }
}
