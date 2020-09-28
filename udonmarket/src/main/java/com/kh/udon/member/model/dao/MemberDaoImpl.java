package com.kh.udon.member.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.udon.member.model.vo.Evaluate;
import com.kh.udon.member.model.vo.Keyword;
import com.kh.udon.member.model.vo.Location;
import com.kh.udon.member.model.vo.Member;
import com.kh.udon.member.model.vo.Review;

@Repository
public class MemberDaoImpl implements MemberDao
{
    @Autowired
    private SqlSessionTemplate session;

	@Override
	public int updateLocation(Map<String, Object> map) {
		return session.update("member.updateLocation", map);
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
	public Member selectOneMember(String userId) {
		return session.selectOne("member.selectOneMember", userId);
	}

	@Override
	public int selectRadius(String userId) {
		return session.selectOne("member.selectRadius", userId);
	}

	@Override
	public int updateRadius(Map<String, Object> map) {
		return session.update("member.updateRadius", map);
	}

	@Override
	public int updateAddr(Map<String, Object> map) {
		return session.update("member.updateAddr", map);
	}

	@Override
	public int selectKeyword(Map<String, Object> key) {
		return session.selectOne("member.selectKeyword", key);
	}

	@Override
	public List<Evaluate> selectAllEva(String userId) {
		return session.selectList("member.selectAllEva", userId);
	}

	@Override
	public int selectTotalReview(String userId) {
		return session.selectOne("member.selectTotalReview", userId);
	}

	@Override
	public List<Review> selectAllReview(String userId) {
		return session.selectList("member.selectAllReview", userId);
	}

	@Override
	public int insertMember(Member member) {
		return session.insert("member.insertMember", member);
	}

	@Override
	public int insertLocation(String userId) {
		return session.insert("member.insertLocation", userId);
	}
}
