package com.kh.udon.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.udon.member.model.service.MemberService;
import com.kh.udon.member.model.vo.Keyword;
import com.kh.udon.member.model.vo.Location;
import com.kh.udon.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/member")
@SessionAttributes(value = { "loginMember" })
@Slf4j
public class MemberController {
	@Autowired
	private MemberService service;

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	// 로그인
	@RequestMapping("/loginForm")
	public String memberLoginForm() {
		return "member/memberLoginForm";
	}

	// 회원가입
	@RequestMapping(value = "/signupForm", method = RequestMethod.GET)
	public String memberSignup() {
		return "member/memberSignupForm";
	}

	@RequestMapping(value = "/signupForm", method = RequestMethod.POST)
	public String memberSignup(Member member, RedirectAttributes redirectAttr) {
		log.debug("member@controller = {}", member);

		String rawPassword = member.getPassword();
		String encryptPassword = bcryptPasswordEncoder.encode(rawPassword);
		member.setPassword(encryptPassword);

		log.debug("rawPassword@controller = {}", rawPassword);
		log.debug("encryptPassword@controller = {}", encryptPassword);

		int result = service.insertMember(member);

		String msg = (result > 0) ? "회원가입성공!" : "회원가입성공!";
		log.debug("msg@controller = " + msg);
		redirectAttr.addFlashAttribute("msg", msg);

		return "redirect:/";
	}

	@RequestMapping("/login")
	public String memberLogin(@RequestParam String userId, @RequestParam String password, Model model,
			RedirectAttributes redirectAttr, HttpSession session) {

		log.debug("userId = {}, password = {}", userId, password);
		Member member = service.selectOneMember(userId);
		log.debug("member = {}", member);

		String location = "/";

		// 로그인 성공
		 if(member != null && bcryptPasswordEncoder.matches(password,member.getPassword())) { //세션처리 model.addAttribute("loginMember", member);
		 
		  //세션에서 next값 가져오기 
	      String next = (String)session.getAttribute("next");
		  location = next != null ? next : location; session.removeAttribute("next"); }
		  //로그인 실패 
		  else { 
			  redirectAttr.addFlashAttribute("msg", "아이디 또는 비밀번호가 틀렸습니다.");
		  }
		return "redirect:" + location;
	}

	@PostMapping("/memberLoginFailure.do")
	public String memberLoginFailure(RedirectAttributes redirectAttr) {
		redirectAttr.addFlashAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");
		return "redirect:/member/memberLoginForm";
	}

	@RequestMapping("/logout")
	public String memberLogout(SessionStatus sessionStatus) {
		if (sessionStatus.isComplete() == false) {
			sessionStatus.setComplete();
		}

		return "redirect:/";
	}
	
	@GetMapping("/checkIdDuplicate")
	public ModelAndView checkIdDuplicate(ModelAndView mav,
										  @RequestParam("userId") String userId) {
		
		//1. 업무로직 : 중복체크
		Member member = service.selectOneMember(userId);
		boolean isUsable = member == null;
		
		//2. model에 속성등록
		mav.addObject("isUsable", isUsable);
		
		//3. viewName : jsonView빈 지정
		mav.setViewName("jsonView");// /WEB-INF/views/jsonView.jsp
		
		return mav;
	}

	@RequestMapping("/mypage")
	public String mypage() {
		return "member/mypage";
	}

	// 프로필 수정
	@RequestMapping("/editprofile")
	public String editProfile() {
		return "member/editProfile";
	}

	// 관심목록
	@RequestMapping("/wishList")
	public String wishList() {
		return "member/wishList";
	}

	// 판매내역
	@RequestMapping("/salesList")
	public String salseList() {
		return "member/salesList";
	}

	// 구매내역
	@RequestMapping("/buyList")
	public String buyList() {
		return "member/buyList";
	}

	// 내 동네 설정 페이지 띄우기
	@RequestMapping("/settingsArea")
	public Model settingsArea(Model model, HttpSession session) {

		// 세션에 담긴 로그인 중 인 유저 아이디
//    	String userId = ((Member)session.getAttribute("loginMember")).getUserId();
		// test id로 테스트 (세션에 담긴 로그인 중인 아이디)
		String userId = "test";
		log.debug("loginMemberId = {} ", userId);

		int radius = service.selectRadius(userId);
		log.debug("radius = {}", String.valueOf(radius));
		model.addAttribute("radius", radius);

		return model;
	}

	// 현재 위치로 location 테이블 update
	// 현재 위치(주소)로 member 테이블 update
	@PostMapping("/updateAddress")
	public String updateAddress(RedirectAttributes redirectAttr, HttpSession session, @RequestParam("addr") String addr,
			@RequestParam("lat") float latitude, @RequestParam("lon") float longitude) {

		// 세션에 담긴 로그인 중 인 유저 아이디
//    	String userId = ((Member)session.getAttribute("loginMember")).getUserId();
		// test id로 테스트
		String userId = "test";

		// 업무로직
		String msg = "변경 성공!";
		Location loc = new Location(userId, latitude, longitude);
		try {
			int result = service.updateLocation(loc);
			redirectAttr.addFlashAttribute("msg", msg);
		} catch (Exception e) {
			log.error("location 수정 실패 오류", e);
			redirectAttr.addFlashAttribute("msg", "변경 실패");

//			throw e; //에러페이지
		}

		return "redirect:/member/settingsArea";
	}

	@PostMapping("/updateRadius")
	@ResponseBody
	public Map<String, Object> updateRadius(HttpSession session, @RequestParam("radius") int radius) {

		// test id로 테스트
		String userId = "test";
		// 세션에 담긴 로그인 중 인 유저 아이디
//    	String userId = ((Member)session.getAttribute("loginMember")).getUserId();

		log.debug(String.valueOf(radius));

		Map<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("radius", radius);

		int result = service.updateRadius(map);

		return map;
	}

	// 자주 묻는 질문
	@RequestMapping("/FAQ")
	public String FAQ() {
		return "member/FAQ";
	}

	// 공지 사항
	@RequestMapping("/announce")
	public String announce() {
		return "member/announce";
	}

	// 관심 주제 목록
	@RequestMapping("/interList")
	public String interList() {
		return "member/interList";
	}

	// 동네생활 댓글
	@RequestMapping("/myComment")
	public String mycomment() {
		return "member/myComment";
	}

	// 동네생활 게시글
	@RequestMapping("/myPost")
	public String mypost() {
		return "member/myPost";
	}

	// 나의 키워드 알림 설정
	@RequestMapping(value = "/keywordNoti", method = RequestMethod.GET)
	public ModelAndView keywordNoti(HttpSession session, ModelAndView mav) {

		// test id로 테스트
		String userId = "test";
		// 세션에 담긴 로그인 중 인 유저 아이디
//    	String userId = ((Member)session.getAttribute("loginMember")).getUserId();

		List<Keyword> list = service.selectKeywordList(userId);
		log.debug("list = {}", list);

		// 전체 키워드 수 구하기
		int totalKeywordContents = service.selectTotalKeywordContent(userId);
		log.debug("totalKeywordContents ={}", String.valueOf(totalKeywordContents));

		mav.addObject("totalKeywordContents", totalKeywordContents);
		mav.addObject("list", list);
		return mav;
	}

	// 나의 키워드 추가
	@RequestMapping(value = "/insertKeyword", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertKeyword(HttpSession session, @RequestParam("userId") String userId,
			@RequestParam("keyword") String keyword) {

		// test id로 테스트
		userId = "test";
		// 세션에 담긴 로그인 중 인 유저 아이디
//    	String userId = ((Member)session.getAttribute("loginMember")).getUserId();

		Map<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("keyword", keyword);
		System.out.println(map);

		int result = service.insertKeyword(map);

		return map;
	}

	// 키워드 삭제
	@RequestMapping(value = "/deleteKeyword")
	public String deleteKeyword(RedirectAttributes redirectAttr, @RequestParam("key") int keyCode) {

		System.out.println(keyCode);
		String msg = "삭제 성공!";
		try {
			int result = service.deleteKeyword(keyCode);
			redirectAttr.addFlashAttribute("msg", msg);
		} catch (Exception e) {
			log.error("keyword 삭제 실패 오류", e);
			redirectAttr.addFlashAttribute("msg", "삭제 실패");

//			throw e; //에러페이지
		}

		return "redirect:/member/keywordNoti";
	}

	// 받은 거래 후기
	@RequestMapping("/myReviewList")
	public String myReviewList() {
		return "member/myReviewList";
	}

}
