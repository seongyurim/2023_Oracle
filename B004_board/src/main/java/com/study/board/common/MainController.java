package com.study.board.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.study.board.user.UserDAO;
import com.study.board.user.UserTblVO;

@Controller
public class MainController {
    // http://localhost/???를 만드는 클래스

    @Autowired
    private UserDAO userdao;

    @GetMapping("/index")
    public String index()
    {
        return "index";
    }

    @GetMapping("/login")
    public String login()
    {
        return "login";
    }

    @PostMapping("/login")
    public void login(@ModelAttribute("UserTblVO") UserTblVO vo,
                        HttpServletRequest request,
                        HttpServletResponse response) throws Exception
    {
        UserTblVO resultVO = userdao.selectOneUser(vo);

        // 로그인 정보가 있다.
        if (resultVO != null) {
            //세션을 저장한다.
            SessionUtil.set(request, "USER", vo);
            response.sendRedirect("index");
        } else {
            response.sendRedirect("login");
        }
        
    }


}
