package org.zerock.controller;

import org.springframework.beans.factory.annotation.Autowired;
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
		log.info("컨트롤러 작동");
		DashboardVO dashboard = service.getDashboard();
		log.info("대쉬보드 -> " + dashboard);
		model.addAttribute("dashboard", dashboard);
		return "/home";
	}
}
