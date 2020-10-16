package com.kh.udon.social.kakao.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.udon.member.model.vo.Member;
import com.kh.udon.social.kakao.KakaoAccessToken;
import com.kh.udon.social.kakao.KakaoLogout;
import com.kh.udon.social.kakao.KakaoUnlink;
import com.kh.udon.social.kakao.KakaoUserInfo;
import com.kh.udon.social.kakao.model.service.KakaoService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class KakaoController {

	@Autowired
	private KakaoService kakaoService;
	
	// 결과값 초기화
	private int result = 0;
	
	JsonNode accessToken;
	
	@RequestMapping(value = "/kakaologin", produces="application/json", method= RequestMethod.GET)
	public String kakaoLogin(@RequestParam("code") String code, RedirectAttributes redirectAttr, HttpSession session, HttpServletResponse response) throws IOException{
		
		log.debug("kakao code : ", code);
		
		// JsonNode트리형태로 토큰받아온다
		JsonNode jsonToken = KakaoAccessToken.getAccessToken(code);
		// 여러 json객체 중 access_token을 가져온다
		accessToken = jsonToken.get("access_token");
		
		log.debug("access_token = ", accessToken);
		
		//access_token을 통해 사용자 정보 요청
		JsonNode userInfo = KakaoUserInfo.getKakaoUserInfo(accessToken);
		
		log.debug("userInfo = ", userInfo);
		
		//Get id
		String userId = userInfo.path("id").asText();
		String nickName = null;
		String email = null;
		
		//가입되어 있는지 카카오 아이디로 찾는다. 
		result = kakaoService.getKakaoLogin(userId);
		
		//유저정보 카카오에서 가져오기 Get properties
		JsonNode properties = userInfo.path("properties");
		JsonNode kakao_account = userInfo.path("kakao_account");
		
		nickName = properties.path("nickname").asText();
		email = kakao_account.path("email").asText();
		
		log.debug("userId = ", userId);
		log.debug("nickName = ", nickName);
		log.debug("email = ", email);
		log.debug("result = ", result);
		
		//사용할 카카오 아이디를 세션에 저장
		session.setAttribute("userId", userId);
		
		//파라미터에 닉네임과 이메일을 저장
		redirectAttr.addAttribute("nickName", nickName);
		redirectAttr.addAttribute("email", email);
		
		//카카오 로그인 정보가 존재 할 경우
		if(result == 1) {
			
			Member member = kakaoService.kakaoLoginPass(userId);
			
			// 세션 저장하기 전에 비밀번호 가리기
			member.setPassword("");
			
			// 접속자 아이디를 세션에 담기
			session.setAttribute("loginUserId", member.getUserId());
			
			//세션에 vo 객체를 저장
			session.setAttribute("UserSession", member);
			
		}
		
		return "redirect:/member/signupForm";
	}
	
	@RequestMapping(value="/kakaologout", produces = "application/json", method= RequestMethod.GET)
	public String kakaologout() {
		
		
		JsonNode userInfo = KakaoLogout.kakaoUserLogout(accessToken);
		
		//GetId
		String userId = userInfo.path("id").asText();
		
		log.debug("Logout Id = ", userId);
		log.debug("accessToken = ", accessToken);
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/kakaounlink", produces = "application/json", method = RequestMethod.GET)
	public void kakaounlink() {
		
		
		JsonNode userInfo = KakaoUnlink.kakaoUserUnlink(accessToken);
		
		//getId
		String userId = userInfo.path("id").asText();
		
		log.debug("탈퇴 아이디  = " + userId);
		log.debug("accessToken = "+ accessToken);
	}
}
