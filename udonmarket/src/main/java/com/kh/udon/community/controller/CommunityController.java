package com.kh.udon.community.controller;

import java.util.ArrayList;
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

import com.kh.udon.common.model.vo.PageInfo;
import com.kh.udon.common.template.Pagination;
import com.kh.udon.community.model.service.CommunityService;
import com.kh.udon.community.model.vo.Community;
import com.kh.udon.community.model.vo.LikeThis;
import com.kh.udon.community.model.vo.Reply;
import com.kh.udon.community.model.vo.Search;
import com.kh.udon.product.model.vo.ReasonReportVO;
import com.kh.udon.product.model.vo.ReportVO;

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
    						Model model, int currentPage
    						, @RequestParam(required = false, defaultValue = "board_title") String searchType
    						, @RequestParam(required = false) String keyword
    						, @RequestParam(required = false) String categoryCode
    						, @RequestParam(required = false) String hashtagCode
    						, @RequestParam(required = false, value="userId") String userId) {

    	
		    	Search search = new Search();
		    	
		    	Map<String, Object> map = new HashMap<String, Object>();
		        map.put("categoryCode", categoryCode);
		        map.put("userId", userId);

		
				search.setSearchType(searchType);
		
				search.setKeyword(keyword);
				
				search.setCategoryCode(categoryCode);
				
				search.setHashtagCode(hashtagCode);
				
				search.setUserId(userId);
				
				int totalCount = service.selectCount(map);
				
			
				PageInfo pi = Pagination.getPageInfo(totalCount, currentPage, 5, 4);
				List<Community> list = service.selectCommunityList(search, pi);

				log.debug("list = {}", list);

				model.addAttribute("list", list);
				model.addAttribute("pi", pi);

				return "community/communityListView";
    }
    
    // 게시글 상세보기
    @RequestMapping("/communityDetailView")
    public String communityDetail(@RequestParam int bCode, @RequestParam String userId,
			  Model model,
			  @RequestParam(required = false, defaultValue = "board_title") String searchType
				, @RequestParam(required = false) String keyword) throws Exception {
		
    	Search search = new Search();
		
		search.setSearchType(searchType);

		search.setKeyword(keyword);
		
		search.setUserId(userId);
		
    	
    			Community community = service.selectOneCommunityCollection(bCode);
    			List<Community> list = service.selectCommunityNewList(search);
    			List<Reply> replyList = service.ReplyList(bCode);
    			List<ReasonReportVO> reasonReport = service.selectReasonReport();
    			List<ReasonReportVO> reasonReport2 = service.selectReasonReport2();
    			log.debug("Community = {}", community);
				log.debug("list = {}", list);

    			model.addAttribute("community", community);
    			model.addAttribute("list", list);
    			model.addAttribute("replyList", replyList);
    			model.addAttribute("reasonReport", reasonReport);
    			model.addAttribute("reasonReport2", reasonReport2);
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
    	
    	return "redirect:/community/communityDetailView?userId=" + userId + "&bCode=" + bCode;
    	
    }

    // 댓글 작성
	@RequestMapping(value="/saveReply", method = RequestMethod.POST)
	public String saveReply(Reply reply, @RequestParam(value="userId") String userId, RedirectAttributes rttr) throws Exception {
		log.info("saveReply");
		
		service.saveReply(reply);
		
		rttr.addAttribute("bCode", reply.getBCode());

		
		return "redirect:/community/communityDetailView?userId=" + userId + "&bCode={bCode}";
	}
	
	// 댓글 삭제
	@RequestMapping("/deleteReply")
    public String deleteReply(@RequestParam int replyCode, @RequestParam int bCode, @RequestParam String userId, Model model)
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
        
        
        return "redirect:/community/communityDetailView?userId=" + userId + "&bCode=" + bCode;
        
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
    
    
    // 게시글 신고 리스트
    @GetMapping("/report/{reasonCode}")
    @ResponseBody
    public List<ReasonReportVO> reportList(@PathVariable int reasonCode)
    {
        List<ReasonReportVO> reasonList = service.selectReportListByRCode(reasonCode);
        
        return reasonList;
    }
    
    // 게시글 신고
    @PostMapping(value = "/reportBoard", produces = "application/text; charset=utf8")
    @ResponseBody
    public String reportBoard(ReportVO report)
    {
        int result = service.reportBoard(report);
        
        return result > 0 ? "신고가 접수되었습니다." : "다시 시도해주세요.";
    }
    
 // 댓글 신고 리스트
    @GetMapping("/report2/{reasonCode}")
    @ResponseBody
    public List<ReasonReportVO> reportList2(@PathVariable int reasonCode)
    {
        List<ReasonReportVO> reasonList2 = service.selectReportListByRCode2(reasonCode);
        
        return reasonList2;
    }
    
    // 댓글 신고
    @PostMapping(value = "/reportReply", produces = "application/text; charset=utf8")
    @ResponseBody
    public String reportReply(ReportVO report)
    {
        int result = service.reportReply(report);
        
        return result > 0 ? "신고가 접수되었습니다." : "다시 시도해주세요.";
    }
    
    // 유저 신고
    @PostMapping(value = "/reportUser", produces = "application/text; charset=utf8")
    @ResponseBody
    public String reportUser(ReportVO report)
    {
        int result = service.reportUser(report);
        
        return result > 0 ? "신고가 접수되었습니다." : "다시 시도해주세요.";
    }
    
	/*
	 * @GetMapping("/getData")
	 * 
	 * @ResponseBody public List<Integer> getData(@RequestParam int page) { int
	 * start = (page * 10) + 1; int end = start + 10;
	 * 
	 * log.info("page={}, {}..{}",page,start,end);
	 * 
	 * List<Integer> list = new ArrayList()<>(); for (int i = start; i < end; i++) {
	 * list.add(i); }
	 * 
	 * return list; }
	 */
    
}







