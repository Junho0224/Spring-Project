package org.zerock.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.MemberVO;
import org.zerock.service.MemberService;
import org.springframework.ui.Model;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
   @GetMapping("/login")
   public void login() {
      log.info("login =>");
   }
  

   
   
   @GetMapping("/delete")
   public String delete(@RequestParam("jumin") String jumin, RedirectAttributes rttr) {
       memberService.delete(jumin);
       rttr.addFlashAttribute("message", "삭제되었습니다.");
       return "redirect:/admin/resident/list"; // 목록 페이지로 이동
   }
}
