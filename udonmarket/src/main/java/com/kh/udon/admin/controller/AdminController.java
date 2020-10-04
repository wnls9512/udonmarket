package com.kh.udon.admin.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.udon.member.model.service.MemberService;
import com.kh.udon.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AdminController {
	
	@Autowired
	private MemberService memberService;
	
	/**
	 * 페이징의 컨텐츠영역에 대한 기능구현을 
	 * mybatis에서 지원하는 rowbounds를 사용한다.
	 * - offset : 건너뛸 게시물수 (cPage - 1) * numPerPage
	 * 		- 1page : 1~10 (offset : 0)
	 * 		- 2page : 11~20 (offset : 10)
	 * 		- 3page : 21~30 (offset : 20)
	 * - limit : 한페이지에 표시될 게시물 수 (numPerPage)
	 * 
	 * @param mav
	 * @return
	 */
	
	@GetMapping("/admin/memberList")
	public ModelAndView memberList(ModelAndView mav,@RequestParam(defaultValue = "1", value = "cPage") int cPage) {
	
		
		final int limit = 10;
		int offset = (cPage - 1) * limit;
		
		List<Member> list = memberService.selectMemberList(limit, offset); 
		log.debug("list = {}", list);
		
		//전체 컨텐츠 수
		int totalContents = memberService.selectMemberTotalContents();
		
		return mav;
		
	}
	
	/**
	 * 사용자요청을 command vo에 바인딩할 때 세부설정함.
	 * @param binder
	 */
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, 
									new CustomDateEditor(sdf, true));
	}
}
