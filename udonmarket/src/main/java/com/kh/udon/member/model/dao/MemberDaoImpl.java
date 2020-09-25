package com.kh.udon.member.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.udon.member.model.vo.Keyword;
import com.kh.udon.member.model.vo.Location;
import com.kh.udon.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao
{
    @Autowired
    private SqlSessionTemplate session;

	@Override
	public int updateLocation(Location loc) {
		return session.update("member.updateLocation", loc);
	}

	@Override
	public int insertKeyword(Map<String, Object> map) {
		return session.update("member.insertKeyword", map);
	}

	@Override
	public List<Keyword> selectKeywordList(String userId) {
		return session.selectList("member.selectKeywordList", userId);
	}

	@Override
	public int selectTotalKeywordContent(String userId) {
		return session.selectOne("member.selectTotalKeywordContent", userId);
	}

	@Override
	public int deleteKeyword(int keyCode) {
		return session.delete("member.deleteKeyword", keyCode);
	}

	@Override
	public int insertMember(Member member) {
		return session.insert("member.insertMember", member);
	}

	@Override
	public Member selectOneMember(String userId) {
		return session.selectOne("member.selectOneMember", userId);
	}

}
