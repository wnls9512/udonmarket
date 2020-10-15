package com.kh.udon.social.kakao.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.udon.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class KakaoDaoImpl implements KakaoDao {

	@Autowired
    private SqlSessionTemplate session;

	@Override
	public int getKakaoLogin(String userId) {
		return session.selectOne("social.getKakaoLogin", userId);
	}

	@Override
	public Member kakaoLoginPass(String userId) {
		return session.selectOne("social.kakaoLoginPass", userId);
	}
}
