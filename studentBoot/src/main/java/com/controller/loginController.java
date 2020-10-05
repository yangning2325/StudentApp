package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller

public class loginController {
    @RequestMapping("/login")
    public String toLogin(HttpSession session) {
        if(session!=null){
        session.invalidate();
        }
        return "login";
    }

}
