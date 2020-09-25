package com.kh.udon.member.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.udon.member.model.dao.MemberDao;
import com.kh.udon.member.model.vo.Keyword;
import com.kh.udon.member.model.vo.Location;
import com.kh.udon.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService
{
    @Autowired
    private MemberDao memberDao;

	@Override
	public int updateLocation(Location loc) {
		return memberDao.updateLocation(loc);
	}

	@Override
	public int insertKeyword(Map<String, Object> map) {
		return memberDao.insertKeyword(map);
	}

	@Override
	public List<Keyword> selectKeywordList(String userId) {
		return memberDao.selectKeywordList(userId);
	}

	@Override
	public int selectTotalKeywordContent(String userId) {
		return memberDao.selectTotalKeywordContent(userId);
	}

	@Override
	public int deleteKeyword(int keyCode) {
		return memberDao.deleteKeyword(keyCode);
	}

	@Override
	public int insertMember(Member member) {
		return memberDao.insertMember(member);
	}

	@Override
	public Member selectOneMember(String userId) {
		return memberDao.selectOneMember(userId);
	}

	@Override
	public int selectRadius(String userId) {
		return memberDao.selectRadius(userId);
	}

	@Override
	public int updateRadius(Map<String, Object> map) {
		return memberDao.updateRadius(map);
	}



}
