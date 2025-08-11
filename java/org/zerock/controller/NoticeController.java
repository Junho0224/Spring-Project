package org.zerock.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.domain.NoticeVO;
import org.zerock.service.NoticeService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/notice/*")
@Log4j
public class NoticeController {
	@Autowired
	private NoticeService service;
	// 공지 리스트 출력
	@GetMapping("/list")
    public String noticeList(Model model) {
		log.info("공지리스트출력!!!");
	    List<NoticeVO> noticeList = service.getNoticeList();
	    model.addAttribute("noticeList", noticeList);
	    return "/admin/notice/list";
    }
	// 공지 등록
	@GetMapping("/write") // get 매핑
	public String showWriteForm(@RequestParam("admin_name") String admin_name, Model model) {
		model.addAttribute("admin_name", admin_name);
	    return "/admin/notice/write";
	}
    @PostMapping("/write")
    public String noticeWrite(NoticeVO notice) {
    	service.writeNotice(notice);
        return "redirect:/admin/notice/list";
    }
    // 공지 수정
    @GetMapping("/update") // get 매핑
    public String showUpdateForm(@RequestParam("notice_id") int notice_id, Model model) {
    	NoticeVO notice = service.getNotice(notice_id);
    	model.addAttribute("notice", notice);
    	return "/admin/notice/update";
    }
    @PostMapping("/update")
    public String noticeUpdate(NoticeVO notice) {
    	service.modifyNotice(notice);
	    return "redirect:/admin/notice/view?id=" + notice.getNotice_id();
    }
    // 공지 삭제
    @GetMapping("/delete")
    public String noticeDelete(@RequestParam("notice_id") int notice_id) {
    	service.removeNotice(notice_id);
	    return "redirect:/admin/notice/list";
    }
    // 공지 상세
    @GetMapping("/view")
    public String noticeView(@RequestParam("id") int id, Model model) {
    	NoticeVO notice = service.getNotice(id);
    	model.addAttribute("notice", notice);
	    return "/admin/notice/view";
    }
}