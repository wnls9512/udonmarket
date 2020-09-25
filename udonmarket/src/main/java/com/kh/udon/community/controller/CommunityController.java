package com.kh.udon.community.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.udon.community.model.service.CommunityService;
import com.kh.udon.community.model.vo.Community;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/community")
@Slf4j
public class CommunityController
{
    @Autowired
    private CommunityService service;
    
//    @Autowired
//	ServletContext servletContext;
//	
//	@Autowired
//	ResourceLoader resourceLoader;
    
    @RequestMapping("/communityListView")
    public String CommunityList(Model model) {
//							  @RequestParam(defaultValue = "1", 
//								value = "cPage") int cPage) {
				//1.사용자 입력값 
//				final int limit = 10;
//				int offset = (cPage - 1) * limit;
				
				//2. 업무로직
				List<Community> list = service.selectCommunityList();
				log.debug("list = {}", list);
				
				//전체컨텐츠수 구하기
//				int totalContents = service.selectBoardTotalContents();
				
				
				//3. view단 처리
//				mav.addObject("totalContents", totalContents);
				model.addAttribute("list", list);
				return "community/communityListView";
    }
    
    @RequestMapping("/communityDetailView")
    public String communityDetail(@RequestParam int bCode,
			  Model model) {
		
    			Community community = service.selectOneCommunityCollection(bCode);
    			log.debug("Community = {}", community);

    			model.addAttribute("community", community);
    			return "community/communityDetailView";
    }
}





