package com.kh.udon.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.udon.member.model.vo.Evaluate;
import com.kh.udon.member.model.vo.Keyword;
import com.kh.udon.member.model.vo.Member;
import com.kh.udon.member.model.vo.Review;
import com.kh.udon.member.model.vo.Wish;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class MemberDaoImpl implements MemberDao
{
    @Autowired
    private SqlSessionTemplate session;

	@Override
	public int updateLocation(Map<String, Object> map) {
		return session.update("member.updateLocation", map);
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
	public int insertMember(Map<String, Object> map) {
		return session.insert("member.insertMember", map);
	}

	@Override
	public int insertLocation(Map<String, Object> map) {
		return session.insert("member.insertLocation", map);
	}
	
	@Override
	public int insertAuthority(Map<String, Object> map) {
		return session.insert("member.insertAuthority", map);
	}
	
	@Override
	public int insertScore(Map<String, Object> map) {
		return session.insert("member.insertScore", map);
	}
	
	@Override
	public int inserEvaluate(Map<String, Object> map) {
		return session.insert("member.inserEvaluate", map);
	}

	
	public List<Wish> selectAllSalesPro(String userId) {
		return session.selectList("member.selectAllSalesPro", userId);
	}

	@Override
	public List<Wish> selectAllBuyPro(String userId) {
		return session.selectList("member.selectAllBuyPro", userId);
	}

	@Override
	public List<Wish> selectAllWishPro(String userId) {
		return session.selectList("member.selectAllWishPro", userId);
	}

	@Override
	public int insertKeyword(Keyword key) {
		return session.insert("member.insertKeyword", key);
	}

	@Override
	public int deleteWish(int wishCode) {
		return session.delete("member.deleteWish", wishCode);
	}

	@Override
	public int insertWish(Map<String, Object> map) {
		return session.insert("member.insertWish", map);
	}

	@Override
	public List<Member> selectMemberList(int limit, int offset) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("member.selectMemberList", null, rowBounds);
	}

	@Override
	public int selectMemberTotalContents() {
		return session.selectOne("member.selectMemberTotalContents");
	}

	@Override
	public int updateQuitMember(String userId) {
		return session.update("member.updateQuitMember", userId);
	}



}
