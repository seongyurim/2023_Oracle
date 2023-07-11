package com.study.board.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

// @Controller: MainController라는 클래스를 Controller로 사용할 것이다.
@Controller
public class MainController {
    
    @GetMapping("/index")
    public String viewIndex() {
        return "index";
    }

}
