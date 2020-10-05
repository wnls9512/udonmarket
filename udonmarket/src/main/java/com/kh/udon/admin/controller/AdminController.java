package com.kh.udon.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.udon.member.model.service.MemberService;
import com.kh.udon.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
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
	
	@GetMapping("/memberList")
	public ModelAndView memberList(ModelAndView mav,@RequestParam(defaultValue = "1", value = "cPage") int cPage) {
	
		
		final int limit = 10;
		int offset = (cPage - 1) * limit;
		
		List<Member> list = memberService.selectMemberList(limit, offset); 
		log.debug("list = {}", list);
		
		//전체 컨텐츠 수
		int totalContents = memberService.selectMemberTotalContents();
		
		mav.addObject("totalContents", totalContents);
		mav.addObject("list", list);
		mav.setViewName("admin/memberList");
		
		return mav;
		
	}
	
	@RequestMapping(value="/adminMemberEnroll", method = RequestMethod.GET)
	public String adminMemberEnroll() {
		
		return "admin/memberList";
	}
	
	@RequestMapping(value="/adminMemberEnroll", method = RequestMethod.POST)
	public String adminMemberEnroll(Member member, RedirectAttributes redirectAttr) {
		log.debug("member@controller = {}", member);
		
		String rawPassword = member.getPassword();
		String encryptPassword = bcryptPasswordEncoder.encode(rawPassword);
		member.setPassword(encryptPassword);
		
		log.debug("rawPassword@controller = {}", rawPassword);
		log.debug("encryptPassword@controller = {}", encryptPassword);
		
		
		List<Integer> num = new ArrayList<>();
		Map<String, Object> map = new HashMap<>();
		
		for(int i=0;i<=26; i++) {
			num.add(i);
		}
		
		map.put("list", num);
		map.put("userId", member.getUserId());
				
		int result = memberService.insertMemberLocAuthScoreEvaluate(map);
		
		log.debug("result@controller = {}", result);
		
		String msg = (result > 0) ? "회원가입성공!" : "회원가입실패!";
		log.debug("msg@controller = " + msg);
		redirectAttr.addFlashAttribute("msg", msg);
		
		
		return "redirect:/admin/memberList";
	}
	
	@RequestMapping(value="/adminMemberQuit", method = RequestMethod.POST)
	public String adminMemberQuit(@RequestParam("userId") String userId, RedirectAttributes redirectAttr) {
		
		int result = memberService.updateQuitMember(userId);
		log.debug("result = {}", result);
		redirectAttr.addFlashAttribute("msg",result > 0  ? "회원 삭제 성공!" : "회원 삭제 실패");
		
		return "redirect:/admin/memberList";
	}
	
	@GetMapping("/declareBoardList")
	public ModelAndView declareBoardList(ModelAndView mav, @RequestParam(defaultValue = "1", value="cPage") int cPage) {
		
		final int limit = 10;
		int offset = (cPage - 1) * limit;
		
		
		
		return mav;
	}
}
