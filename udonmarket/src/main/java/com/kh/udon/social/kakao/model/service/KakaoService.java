package com.kh.udon.social.kakao.model.service;

import java.util.Map;

public interface KakaoService {

	int getKakaoLogin(String userId);

	int insertMemberLocAuthScoreEvaluate2(Map<String, Object> map);

}
