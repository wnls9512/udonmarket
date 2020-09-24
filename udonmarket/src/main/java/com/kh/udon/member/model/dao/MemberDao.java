package com.kh.udon.member.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.udon.member.model.vo.Keyword;
import com.kh.udon.member.model.vo.Location;

public interface MemberDao
{

	int updateLocation(Location loc);

	int insertKeyword(Map<String, Object> map);

	List<Keyword> selectKeywordList(String userId);

	int selectTotalKeywordContent(String userId);

	int deleteKeyword(int keyCode);

}
