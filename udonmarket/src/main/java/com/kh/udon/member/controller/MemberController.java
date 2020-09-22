package com.kh.udon.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.udon.member.model.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController
{
    @Autowired
    private MemberService service;
    
    @RequestMapping("/loginForm")
    public String memberLogin()
    {
        return "member/memberLoginForm";
    }
    
    @RequestMapping("/signupForm")
    public String memberSignup()
    {
        return "member/memberSignupForm";
    }
    
    @RequestMapping("/mypage")
    public String mypage()
    {
        return "member/mypage";
    }

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
    
}
