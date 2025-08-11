package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.PostVO;
import org.zerock.service.PostService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/board/*")
@AllArgsConstructor
public class PostController {
   private PostService service;
   
   @GetMapping("/list")
   public void list(Model model) {
      model.addAttribute("list",service.getList());
   }
   
   @GetMapping("/write")
   public void register() {}
   
   @PostMapping("/write")
   public String register(PostVO post) {
       service.register(post);
       return "redirect:/board/list";
   }
   
   @GetMapping("view")
   public void get(@RequestParam("post_id") int post_id, Model model) {
      model.addAttribute("post", service.get(post_id));
   }
   
   @PostMapping("/update")
   public String update(PostVO post, RedirectAttributes rttr) {
      service.update(post);
      rttr.addAttribute("post_id", post.getPost_id());
      rttr.addFlashAttribute("result", "updateSuccess");
      return "redirect:/board/list";
   }
   
   @PostMapping("/remove")
   public String delete(@RequestParam("post_id") int post_id) {
      service.delete(post_id);
      return "redirect:/board/list";
   }
   
   
   
   
   
   
   
   
}
