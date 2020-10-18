package com.kh.udon.social.kakao.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.udon.member.model.service.MemberService;
import com.kh.udon.member.model.vo.Member;
import com.kh.udon.social.kakao.KakaoAccessToken;
import com.kh.udon.social.kakao.KakaoUserInfo;
import com.kh.udon.social.kakao.model.service.KakaoService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class KakaoController {

	@Autowired
	KakaoService kakaoService;
	
	JsonNode accessToken;
	
	@RequestMapping(value = "/kakaologin", method= RequestMethod.GET)
	public String kakaoLogin() {
		return "member/loginForm";
	}

	@RequestMapping(value = "/kakaologin", produces = "application/json", method = RequestMethod.POST)
	public String kakaoLogin(@RequestParam("code") String code, RedirectAttributes ra, HttpSession session,HttpServletResponse response, Member member) throws IOException {

		System.out.println("kakao code : " + code);
		
		Map<String, Object> map = new HashMap<>();
		List<Integer> list = new ArrayList<>();
		
		for(int i = 1; i <= 26; i++) {
		    list.add(i);
		}

		// JsonNode트리형태로 토큰받아온다
		JsonNode jsonToken = KakaoAccessToken.getAccessToken(code);
		// 여러 json객체 중 access_token을 가져온다
		accessToken = jsonToken.get("access_token");

		System.out.println("access_token : " + accessToken);

		// access_token을 통해 사용자 정보 요청
		JsonNode userInfo = KakaoUserInfo.getKakaoUserInfo(accessToken);

		// Get id
		String userId = userInfo.path("id").asText();
		String nickName = null;
		String email = null;

		// 가입되어있는지 카카오아이디로 찾는다
		int result = kakaoService.getKakaoLogin(userId);

		// 유저정보 카카오에서 가져오기 Get properties
		JsonNode properties = userInfo.path("properties");
		JsonNode kakao_account = userInfo.path("kakao_account");

		nickName = properties.path("nickname").asText();
		email = kakao_account.path("email").asText();

		System.out.println("id : " + userId);
		System.out.println("name : " + nickName);
		System.out.println("email : " + email);
		
		map.put("list", list);
		map.put("userId", userId);
		map.put("nickname", nickName);
		map.put("email", email);
		
		int result1 = 0;
		
		if(result == 0 || result < 0) {
			 result1 =  kakaoService.insertMemberLocAuthScoreEvaluate2(map);
		}
		
		log.debug("result1@controller = {}", result1);
		
		return "redirect:/";

		// 사용할 카카오아이디와 소셜구분을 세션에 저장
//		session.setAttribute("whatid", userId);

		// 파라메터 저장
//		ra.addAttribute("name", nickName);
//		ra.addAttribute("email", email);

		
	}

//	@RequestMapping(value = "/kakaologout", produces = "application/json", method = RequestMethod.GET)
//	public String kakaologout() {
//
//		JsonNode userInfo = KakaoLogout.kakaoUserLogout(accessToken);
//		// Get id
//		String id = userInfo.path("id").asText();
//
//		System.out.println("로그아웃 아이디 : " + id);
//		System.out.println(accessToken);
//
//		return "redirect:/";
//	}

//	@RequestMapping(value = "/kakaounlink", produces = "application/json", method = RequestMethod.GET)
//	public void kakaounlink() {
//
//		JsonNode userInfo = KakaoUnlink.kakaoUserUnlink(accessToken);
//		// Get id
//		String id = userInfo.path("id").asText();
//
//		System.out.println("탈퇴 아이디 : " + id);
//		System.out.println(accessToken);
//	}
}
