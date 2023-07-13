package com.myown.study.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.myown.study.user.UserDAO;
import com.myown.study.user.UserTblVO;

@Controller
public class MainController {

    @Autowired
    private UserDAO userdao;

    @GetMapping("/index")
    public String index() {
        return "index";
    }
    
    @GetMapping("/index")
    public String index(@ModelAttribute("UserTblVO") UserTblVO vo, Model model) throws Exception {
        // 세션에 저장되어 있는 사용자 정보를 모델에 얹어주는 기능을 넣어주어야 한다.

        UserTblVO resultVO = userdao.selectOneUser(vo);

        // 결과를 가지고 JSP를 만들어서 보내준다.
        model.addAttribute("vo", resultVO);

        return "index";
    }
    
    @GetMapping("/login")
    public String login() {
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
