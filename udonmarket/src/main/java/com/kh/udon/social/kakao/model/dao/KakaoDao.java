package com.kh.udon.social.kakao.model.dao;

import java.util.Map;

public interface KakaoDao {

	int getKakaoLogin(String userId);

	int insertMember(Map<String, Object> map);

}
