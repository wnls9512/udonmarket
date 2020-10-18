package com.kh.udon.social.kakao.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class KakaoDaoImpl implements KakaoDao {

	@Autowired
	private SqlSessionTemplate session;

	@Override
	public int getKakaoLogin(String userId) {
		return session.selectOne("social.getKakaoLogin", userId);
	}

	@Override
	public int insertMember(Map<String, Object> map) {
		return session.insert("social.insertMember", map);
	}
}
