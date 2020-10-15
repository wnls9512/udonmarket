package com.kh.udon.social.kakao.model.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.udon.member.model.vo.Member;
import com.kh.udon.social.kakao.model.dao.KakaoDao;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class KakaoServiceImpl implements KakaoService {

	@Autowired
	private KakaoDao kakaoDao;
	
	@Override
	public int getKakaoLogin(String userId) {
		return kakaoDao.getKakaoLogin(userId);
	}

	@Override
	public Member kakaoLoginPass(String userId) {
		return kakaoDao.kakaoLoginPass(userId);
	}

}
