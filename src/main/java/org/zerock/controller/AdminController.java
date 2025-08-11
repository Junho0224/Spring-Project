package org.zerock.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.AdminVO;
import org.zerock.domain.DashboardVO;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.AdminMapper;
import org.zerock.service.DashboardService;
import org.zerock.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/admin/*")
@AllArgsConstructor
public class AdminController {
   private MemberService service;
   private DashboardService dashboardService;
   private AdminMapper adminMapper;
   
   @GetMapping("/dashboard")
   public String dashboardchk(Model model, Authentication authentication, HttpServletRequest request, HttpServletResponse response) {
      System.out.println("/admin/dashboard 컨트롤러 도달");
      log.info(">> 로그인 성공한 사용자: " + authentication.getName());
       authentication.getAuthorities().forEach(auth -> {
           log.info(">> 권한: " + auth.getAuthority());
       });
       
       // 1. 인증된 사용자 정보 꺼내기 (UserDetails)
       User user = (User) authentication.getPrincipal();
       String username = user.getUsername();
       log.info("로그인한 사용자: " + username);

       // 2. DB에서 AdminVO 가져오기
       AdminVO admin = adminMapper.findByAdminName(username);  // 너가 만든 쿼리 이름에 따라 다름
       log.info("DB에서 가져온 관리자: " + admin);

       // 3. 세션에 저장
       HttpSession session = request.getSession();
       session.setAttribute("loginAdmin", admin);
       
       DashboardVO dashboard = dashboardService.getDashboard();
      model.addAttribute("dashboard", dashboard);
       return "/admin/dashboard";
   }
   
   @GetMapping("/resident/register")
   public String showRegisterForm() {
       return "admin/resident/register"; // 등록폼 jsp 경로
   }

   @PostMapping("/resident/register")
   public String register(MemberVO member, RedirectAttributes rttr) {
       service.register(member);
       rttr.addFlashAttribute("message", "등록이 완료되었습니다.");
       return "redirect:/admin/resident/list";
   }
   
   @GetMapping("/resident/view")
   public String view(@RequestParam("member_id") String member_id, Model model) {
       MemberVO member = service.get(member_id);
       model.addAttribute("member", member);
       return "admin/resident/view"; // 이 경로 기준으로 JSP 위치 정해져
   }

   @GetMapping("/resident/update")
   public String updateForm(@RequestParam("member_id") String member_id, Model model) {
       MemberVO member = service.get(member_id);
       model.addAttribute("member", member);
       return "admin/resident/update"; // 수정 폼의 JSP 경로
   }
   
   @PostMapping("/resident/update")
   public String update(MemberVO member, RedirectAttributes rttr) {
       service.update(member);
       rttr.addFlashAttribute("message", "수정되었습니다.");
       return "redirect:/admin/resident/view?jumin=" + member.getJumin();
   }
     
     @GetMapping("/resident/list") 
     public String list(Model model) {
     List<MemberVO> list = service.getList();
     model.addAttribute("memberList", list); return "/admin/resident/list"; }
    
     @GetMapping("/resident/delete")
     public String delete(@RequestParam("member_id") String member_id, Model model) {
        service.delete(member_id);
        return "redirect:/admin/resident/list";
     }

}
