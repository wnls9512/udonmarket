package com.kh.udon.community.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.udon.community.model.service.CommunityService;
import com.kh.udon.community.model.vo.Community;
import com.kh.udon.community.model.vo.LikeThis;
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
    
    // 게시글 리스트 & 검색
    @RequestMapping("/communityListView")
	public String CommunityList(/* @RequestParam int categoryCode, */
    						Model model
    						, @RequestParam(required = false, defaultValue = "board_title") String searchType
    						, @RequestParam(required = false) String keyword
    						, @RequestParam(required = false) String categoryCode
    						, @RequestParam(required = false) String hashtagCode
    						, @RequestParam(required = false) String userId) {
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
				
				search.setHashtagCode(hashtagCode);
				
				search.setUserId(userId);
				
				
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
    
    // 게시글 상세보기
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
    
    // 게시글 작성
    @RequestMapping("/communityForm")
	public String communityForm(/* @RequestParam String userId */) {
    	
    	return "community/communityForm";
    	
    }
    @RequestMapping("/communityFormDone")
    public String register(@ModelAttribute("community") Community community, @RequestParam String userId, RedirectAttributes rttr, Model model) throws Exception
    {
        int result = service.insert(community);
        
		
		rttr.addFlashAttribute("msg", result > 0 ? "게시글 등록 성공 💛" : "게시글 등록 실패 🤔");
		 
        
        return "redirect:/community/communityListView?userId=" + userId;
    }
    
    //좋아요
    @RequestMapping("/likeThis")
    public String likeThis(@RequestParam int bCode, @RequestParam String userId, Model model) {
    	
    	LikeThis like = new LikeThis();
    	
    	like.setBCode(bCode);
    	like.setUserId(userId);
    	
    	service.likeThis(like);
    	
    	return "redirect:/community/communityDetailView?bCode=" + bCode;
    	
    }

    // 댓글 작성
	@RequestMapping(value="/saveReply", method = RequestMethod.POST)
	public String saveReply(Reply reply, RedirectAttributes rttr) throws Exception {
		log.info("saveReply");
		
		service.saveReply(reply);
		
		rttr.addAttribute("bCode", reply.getBCode());

		
		return "redirect:/community/communityDetailView?bCode={bCode}";
	}
	
	// 댓글 삭제
	@RequestMapping("/deleteReply")
    public String deleteReply(@RequestParam int replyCode, @RequestParam int bCode, Model model)
    {
//        Map<String, Object> map = new HashMap<>();
        
//        String msg = "삭제되었습니다 😄";
        
        try 
        {
            int result = service.deleteReply(replyCode);
        } 
        catch(Exception e) 
        {
//        	e.printStackTrace();
//            log.error("메뉴 삭제 오류", e);
//            msg = "삭제에 실패했어요 💧";
        }
        
//        map.put("msg", msg);
        
        
        return "redirect:/community/communityDetailView?bCode=" + bCode;
        
    }
	
	 // 게시글 삭제
    @PutMapping("/{bCode}")
    @ResponseBody
    public Map<String, Object> deleteBoard(@PathVariable int bCode)
    {
        Map<String, Object> map = new HashMap<>();
        
        String msg = "삭제되었습니다 😄";
        
        try 
        {
            int result = service.delete(bCode);
        } 
        catch(Exception e) 
        {
        	e.printStackTrace();
            log.error("메뉴 삭제 오류", e);
            msg = "삭제에 실패했어요 💧";
        }
        
        map.put("msg", msg);
        
        return map;
    }
    
    // 게시글 수정
    @GetMapping("/updateBoard")
    public String updateBoard(@RequestParam int bCode, Model model)
    {
        Community community = service.selectByBCode(bCode);
        
        model.addAttribute("community", community);
        
        return "community/communityUpdateForm";
    }
    @PostMapping("/update")
    public String update(Community community, @RequestParam String userId, RedirectAttributes rttr)
    {
        log.debug("community = {}", community);
        
        int result = service.update(community);
        
        
        rttr.addFlashAttribute("msg", result > 0 ? "게시글 수정 성공 💛" : "게시글 수정 실패 🤔");
        
        return "redirect:/community/communityListView?userId=" + userId;
    }
    
}







