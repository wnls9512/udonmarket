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
    @RequestMapping("/wishList")
    public String wishList()
    {
        return "member/wishList";
    }
    
    @RequestMapping("/salesList")
    public String salseList()
    {
        return "member/salesList";
    }
    
    @RequestMapping("/buyList")
    public String buyList()
    {
        return "member/buyList";
    }
    
}
