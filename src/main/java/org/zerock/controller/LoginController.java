package org.zerock.controller;

import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.log4j.Log4j;
@Controller
public class LoginController {
   @GetMapping("/customLogin")
   public String login(Authentication auth) {
      System.out.println("auth -> " + auth);
       if (auth != null) {
           System.out.println("현재 로그인한 사용자: " + auth.getName());
           for (GrantedAuthority ga : auth.getAuthorities()) {
               System.out.println("권한: " + ga.getAuthority());
           }
       }
       
       return "customLogin";
   }
   
   @PostMapping("/login")
   public String login(@RequestParam String username, @RequestParam String password, HttpSession session) {
       session.setAttribute("name", username); // 
       return "/";
   }
   
}
