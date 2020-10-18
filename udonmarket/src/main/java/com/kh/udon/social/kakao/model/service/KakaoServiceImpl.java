package com.kh.udon.social.kakao.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.udon.member.model.dao.MemberDao;
import com.kh.udon.social.kakao.model.dao.KakaoDao;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class KakaoServiceImpl implements KakaoService {

	@Autowired
	private KakaoDao kakaoDao;
	
	@Autowired
    private MemberDao memberDao;
	
	@Override
	public int getKakaoLogin(String userId) {
		return kakaoDao.getKakaoLogin(userId);
	}

	@Transactional(rollbackFor = { Exception.class })
	@Override
	public int insertMemberLocAuthScoreEvaluate2(Map<String, Object> map) {
		
		int result = 0;
		
		result = kakaoDao.insertMember(map);
		
		if(result > 0) {
			result = memberDao.insertLocation(map);
			log.debug("result = {}", result);
			result = memberDao.insertAuthority(map);
			log.debug("result = {}", result);
			result = memberDao.insertScore(map);
			log.debug("result = {}", result);
			result = memberDao.insertEvaluate(map);
			log.debug("result = {}", result);
		}
		
		return result;
	}

}
