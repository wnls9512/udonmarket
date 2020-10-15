package com.kh.udon.social.kakao.model.dao;

import com.kh.udon.member.model.vo.Member;

public interface KakaoDao {

	int getKakaoLogin(String userId);

	Member kakaoLoginPass(String userId);

}
