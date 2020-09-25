package com.kh.udon.member.model.service;

import java.util.List;
import java.util.Map;

import com.kh.udon.member.model.vo.Keyword;
import com.kh.udon.member.model.vo.Location;
import com.kh.udon.member.model.vo.Member;

public interface MemberService
{
	int updateLocation(Location loc);

	int insertKeyword(Map<String, Object> map);

	List<Keyword> selectKeywordList(String userId);

	int selectTotalKeywordContent(String userId);

	int deleteKeyword(int keyCode);

	int insertMember(Member member);

	Member selectOneMember(String userId);
}
