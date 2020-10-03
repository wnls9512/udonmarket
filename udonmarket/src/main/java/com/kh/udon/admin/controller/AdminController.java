package com.kh.udon.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AdminController {
	
	@GetMapping("/admin/memberList")
	public void memberList() {
	
	}
}
