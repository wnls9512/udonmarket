package com.kh.udon.social.kakao.model.service;

import javax.servlet.http.HttpSession;

import com.kh.udon.member.model.vo.Member;

public interface KakaoService {

	int getKakaoLogin(String userId);

	Member kakaoLoginPass(String userId);

}
