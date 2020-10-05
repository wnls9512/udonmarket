package com.kh.udon.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.udon.member.model.vo.announce;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AdminController {
	
	@GetMapping("/admin/memberList")
	public void memberList() {
	
	}
	@RequestMapping("/admin/announceForm")
	public ModelAndView announceForm(ModelAndView mav) {
		mav.setViewName("admin/announceForm");
		return mav;
	}
	
	@PostMapping("/admin/announceEnroll")
	public String announceEnroll(announce Announce) {
		
		log.debug("Announce = {}", Announce);
		
		return "redirect:/member/announce";
	}
}
