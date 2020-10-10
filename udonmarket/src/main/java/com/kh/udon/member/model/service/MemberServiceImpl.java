package com.kh.udon.member.model.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.udon.community.model.vo.Community;
import com.kh.udon.community.model.vo.Reply;
import com.kh.udon.member.model.dao.MemberDao;
import com.kh.udon.member.model.vo.Evaluate;
import com.kh.udon.member.model.vo.Keyword;
import com.kh.udon.member.model.vo.Member;
import com.kh.udon.member.model.vo.Review;
import com.kh.udon.member.model.vo.announce;
import com.kh.udon.member.model.vo.Wish;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MemberServiceImpl implements MemberService
{
    @Autowired
    private MemberDao memberDao;

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

	@Transactional(rollbackFor = { Exception.class })
	@Override
	public int updateAddrAndLoc(Map<String, Object> map) {
		int result = 0;
		
		result = memberDao.updateLocation(map);		
		if(result > 0) { 
			result = memberDao.updateAddr(map);
		}else {
//			throw new MemberException("주소 변경 오류!");
		}
		
		return result;
	}

	@Override
	public int selectKeyword(Map<String, Object> key) {
		return memberDao.selectKeyword(key);
	}

	@Override
	public List<Evaluate> selectAllEva(String userId) {
		return memberDao.selectAllEva(userId);
	}

	@Override
	public int selectTotalReview(String userId) {
		return memberDao.selectTotalReview(userId);
	}

	@Override
	public List<Review> selectAllReview(String userId) {
		return memberDao.selectAllReview(userId);
	}

	@Override
	public List<announce> selectAnnounceList(int limit, int offset) {
		return memberDao.selectAnnounceList(limit, offset);
	}
		
	@Transactional(rollbackFor = { Exception.class })
	@Override
	public int insertMemberLocAuthScoreEvaluate(Map<String, Object> map) {
		
		int result = 0;
				
		result = memberDao.insertMember(map);
		log.debug("result = {}", result);
		log.debug("map = {}", map);

		
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
	@Override
	public List<Wish> selectAllSalesPro(String userId) {
		return memberDao.selectAllSalesPro(userId);
	}

	@Override
	public List<Wish> selectAllBuyPro(String userId) {
		return memberDao.selectAllBuyPro(userId);
	}

	@Override
	public List<Wish> selectAllWishPro(String userId) {
		return memberDao.selectAllWishPro(userId);
	}

	@Override
	public int insertKeyword(Keyword key) {
		return memberDao.insertKeyword(key);
	}

	@Override
	public int deleteWish(int wishCode) {
		return memberDao.deleteWish(wishCode);
	}

	@Override
	public int insertWish(Map<String, Object> map) {
		return memberDao.insertWish(map);
	}

	@Override
	public List<Member> selectMemberList(int limit, int offset) {
		return memberDao.selectMemberList(limit, offset);
	}

	@Override
	public int selectMemberTotalContents() {
		return memberDao.selectMemberTotalContents();
	}

	@Override
	public int updateQuitMember(String userId) {
		return memberDao.updateQuitMember(userId);
	}

	@Override
	public int announceEnroll(announce announce) {
		return memberDao.announceEnroll(announce);
	}

	@Override
	public announce selectOneAnnounce(int bCode) {
		return memberDao.selectOneAnnounce(bCode);
	}

	@Override
	public int insertMemberLocAuth(Member member) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMember(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updateNick(Member member) {
		memberDao.updateNick(member);
		
	}

	@Override
	public List<Community> selectPostList(String userId) {
		return memberDao.selectPostList(userId);
	}

	@Override
	public List<Reply> selectReplyList(String userId) {
		return memberDao.selectReplyList(userId);
	}

}
