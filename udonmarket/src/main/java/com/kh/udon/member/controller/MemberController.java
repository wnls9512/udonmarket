package com.kh.udon.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.udon.member.model.service.MemberService;
import com.kh.udon.member.model.vo.Keyword;
import com.kh.udon.member.model.vo.Location;
import com.kh.udon.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/member")
@Slf4j
public class MemberController
{
    @Autowired
    private MemberService service;
    
    @Autowired
    private BCryptPasswordEncoder bcryptPasswordEncoder;    
   
    //로그인
    @RequestMapping("/loginForm")
    public String memberLogin()
    {
        return "member/memberLoginForm";
    }
    
    // 회원가입
    @RequestMapping("/signupForm")
    public String memberSignup()
    {
        return "member/memberSignupForm";
    }
    
    
    @RequestMapping(value="/signupForm", method=RequestMethod.POST)
    public String memberSignup(Member member, RedirectAttributes redirectAttr) {
    	
    	return "redirect:/";
    }
    
    @RequestMapping("/mypage")
    public String mypage()
    {
        return "member/mypage";
    }

    //프로필 수정
	@RequestMapping("/editprofile")
	public String editProfile() 
	{
		return "member/editProfile";
	}
	
    //관심목록
    @RequestMapping("/wishList")
    public String wishList()
    {
        return "member/wishList";
    }
    
    //판매내역
    @RequestMapping("/salesList")
    public String salseList()
    {
        return "member/salesList";
    }
    
    //구매내역
    @RequestMapping("/buyList")
    public String buyList()
    {
        return "member/buyList";
    }
    
    //내 동네 설정
    @RequestMapping("/settingsArea")
    public String settingsArea()
    {
    	return "member/settingsArea";
    }
    
    //자주 묻는 질문
    @RequestMapping("/FAQ")
    public String FAQ()
    {
    	return "member/FAQ";
    }
    
    //나의 키워드 알림 설정
    @RequestMapping(value = "/keywordNoti",
    				method = RequestMethod.GET)
    public ModelAndView keywordNoti(ModelAndView mav){
    	
    	//test id로 테스트
    	String userId = "test";
    	List<Keyword> list = service.selectKeywordList(userId);
    	log.debug("list = {}", list);
    	
    	//전체 키워드 수 구하기
    	int totalKeywordContents = service.selectTotalKeywordContent(userId);
    	log.debug("totalKeywordContents ={}", String.valueOf(totalKeywordContents));
    	
    	mav.addObject("totalKeywordContents", totalKeywordContents);
    	mav.addObject("list", list);
    	return mav;
    }
    
    //나의 키워드 추가
    @RequestMapping(value = "/insertKeyword",
    			method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> insertKeyword(@RequestParam("userId") String userId,
    										 @RequestParam("keyword") String keyword){
    	
    	//test id로 테스트
    	userId = "test";
    	
    	Map<String, Object> map = new HashMap<>();
    	map.put("userId", userId);
    	map.put("keyword", keyword);
    	System.out.println(map);
    	
    	int result = service.insertKeyword(map);
    			
    	return map;
    }
    
    //키워드 삭제
    @RequestMapping(value = "/deleteKeyword")
    @ResponseBody
    public String deleteKeyword(RedirectAttributes redirectAttr,
    							@RequestParam("key") int keyCode){
    	  
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

    //현재 위치로 location 테이블 update
    //현재 위치(주소)로 member 테이블 update (?)
    @PostMapping("/updateAddress")
    public String updateAddress(RedirectAttributes redirectAttr,
    							//로그인 중인 아이디 가져오기
    							//@RequestParam("userId") String userId,
    							@RequestParam("addr") String addr,
    							@RequestParam("lat") float latitude,
    							@RequestParam("lon") float longitude){
    	//test id로 테스트
    	String userId = "test";
    	
    	//업무로직
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
    
    //받은 거래 후기
    @RequestMapping("/myReviewList")
    public String myReviewList(){
    	return "member/myReviewList";
    }
    
    
    
    
}
