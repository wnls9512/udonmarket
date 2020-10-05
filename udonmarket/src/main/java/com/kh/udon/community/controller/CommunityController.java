package com.kh.udon.community.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.udon.community.model.service.CommunityService;
import com.kh.udon.community.model.vo.Community;
import com.kh.udon.community.model.vo.Reply;
import com.kh.udon.community.model.vo.Search;

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
	public String CommunityList(/* @RequestParam int categoryCode, */
    						Model model
    						, @RequestParam(required = false, defaultValue = "board_title") String searchType
    						, @RequestParam(required = false) String keyword
    						, @RequestParam(required = false) String categoryCode) {
//							, @RequestParam(defaultValue = "1", 
//								value = "cPage") int cPage) {
				//1.사용자 입력값 
//				final int limit = 10;
//				int offset = (cPage - 1) * limit;
    	
		    	Search search = new Search();
//		    	Community community = new Community();
		
				search.setSearchType(searchType);
		
				search.setKeyword(keyword);
				
				search.setCategoryCode(categoryCode);
				
				/* community.setCategoryCode(categoryCode); */
				
				//2. 업무로직
				List<Community> list = service.selectCommunityList(search);
				/* List<Community> list2 = service.selectCommunityList(categoryCode); */
//				Community community = service.selectCategory(categoryCode);
				log.debug("list = {}", list);
				/* log.debug("list = {}", list2); */
//				log.debug("Community = {}", community);
				
				//전체컨텐츠수 구하기
//				int totalContents = service.selectBoardTotalContents();
				
				
				//3. view단 처리
//				mav.addObject("totalContents", totalContents);
//				model.addAttribute("community", community);
				model.addAttribute("list", list);
				/* model.addAttribute("list", list2); */
				return "community/communityListView";
    }
    
    @RequestMapping("/communityDetailView")
    public String communityDetail(@RequestParam int bCode,
			  Model model,
			  @RequestParam(required = false, defaultValue = "board_title") String searchType
				, @RequestParam(required = false) String keyword) throws Exception {
		
    	Search search = new Search();
		
		search.setSearchType(searchType);

		search.setKeyword(keyword);
    	
    			Community community = service.selectOneCommunityCollection(bCode);
    			List<Community> list = service.selectCommunityList(search);
    			List<Reply> replyList = service.ReplyList(bCode);
    			log.debug("Community = {}", community);
				log.debug("list = {}", list);

    			model.addAttribute("community", community);
    			model.addAttribute("list", list);
    			model.addAttribute("replyList", replyList);
    			return "community/communityDetailView";
    }
    
    @RequestMapping("/communityForm")
    public String communityForm() {
    	
    	return "community/communityForm";
    	
    }
    

	@RequestMapping(value="/saveReply", method = RequestMethod.POST)
	public String saveReply(Reply reply, RedirectAttributes rttr) throws Exception {
		log.info("saveReply");
		
		service.saveReply(reply);
		
		rttr.addAttribute("bCode", reply.getBCode());

		
		return "redirect:/community/communityListView";
	}
    
}





