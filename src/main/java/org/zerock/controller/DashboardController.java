package org.zerock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.zerock.domain.DashboardVO;
import org.zerock.service.DashboardService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class DashboardController {
   @Autowired
   private DashboardService service;

   @GetMapping("/404")
   public String go404() {
      return "/404";
   }
   
   @GetMapping("/report")
   public String report() {
      return "/report";
   }
   
   @GetMapping("/")
   public String dashboard(Model model) {
      DashboardVO dashboard = service.getDashboard();
      model.addAttribute("dashboard", dashboard);
      return "redirect:/admin/dashboard";
   }
   @GetMapping("/accessDenied")
   public String accessDenied(Authentication auth, Model model) {
       if (auth != null) {
           System.out.println("접근 거부됨: 사용자 = " + auth.getName());
       }
       model.addAttribute("msg", "접근 권한이 없습니다.");
       return "common/accessDenied"; // JSP 경로 예시
   }
}
