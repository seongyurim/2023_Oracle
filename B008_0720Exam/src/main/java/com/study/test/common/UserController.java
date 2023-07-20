package com.study.test.common;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.test.util.SessionUtil;

@Controller
public class UserController {

    @Autowired
    UserDAO userDAO;
    
    @GetMapping("/index")
    public String index(Model model) throws Exception {
        // 요청한 주체에게 세션이 존재하는지 확인
        UserVO userVO = (UserVO)SessionUtil.getAttribute("USER");

        // 존재한다면 모델에 세션정보를 저장하여 index.jsp로 전송
        if (userVO != null) {
            model.addAttribute("vo", userVO);
        }
        return "index";
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @PostMapping("/login")
    public void login(@ModelAttribute("UserVO") UserVO vo,
                      HttpServletRequest request,
                      HttpServletResponse response) throws Exception {

        // VO가 jsp에서 오브젝트를 정상적으로 가져왔는지 확인해본다.
        System.out.println(vo.getMEMBERID());
        System.out.println(vo.getMEMBERPW());

        // DAO가 VO를 통해 쿼리 결과를 받아왔고, 그것을 resultVO 객체에 저장한다.
        UserVO resultVO = userDAO.selectOneUser(vo);
        System.out.println(resultVO);

        if (resultVO == null) {
            // 등록되어 있는 계정이 아니다.
            System.out.println("등록된 사용자가 아닙니다.");
            response.sendRedirect("login"); // 로그인 화면으로 다시 이동
        }
        else {
            // 등록되어 있는 계정이다.
            System.out.println("등록된 사용자입니다.");
            SessionUtil.set(request, "USER", resultVO); // 세션에 계정정보 저장
            response.sendRedirect("index"); // 메인 화면으로 이동
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

    @GetMapping("/join")
    public String join() {
        return "join";
    }
    
    @PostMapping("/checkId")
    @ResponseBody
    public String checkId(@ModelAttribute("UserVO") UserVO vo) throws Exception {
        UserVO resultVO = userDAO.selectOneUser(vo);

        if (resultVO == null) {
            return "OK";
        }
        else {
            return "FAIL";
        }
    }
    
    @PostMapping("/join")
    @ResponseBody
    public String join(@ModelAttribute("UserVO") UserVO vo) throws Exception {
        // VO가 jsp에서 오브젝트를 정상적으로 가져왔는지 확인해본다.
        System.out.println(vo.getMEMBERID());
        System.out.println(vo.getMEMBERPW());
        System.out.println(vo.getNAME());
        System.out.println(vo.getEMAIL());
        System.out.println(vo.getGRADE());

        int resultVO = userDAO.insertUser(vo);

        if (resultVO == 1) {
            System.out.println("회원가입 성공");
            return "OK";
        }
        else {
            System.out.println("회원가입 실패");
            return "FAIL";
        }
    }

 }
