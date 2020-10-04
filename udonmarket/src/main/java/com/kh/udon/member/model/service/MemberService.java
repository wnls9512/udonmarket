package com.kh.udon.member.model.service;

import java.util.List;
import java.util.Map;

import com.kh.udon.member.model.vo.Evaluate;
import com.kh.udon.member.model.vo.Keyword;
import com.kh.udon.member.model.vo.Location;
import com.kh.udon.member.model.vo.Member;
import com.kh.udon.member.model.vo.Review;
import com.kh.udon.member.model.vo.Wish;
import com.kh.udon.product.model.vo.ProductVO;

public interface MemberService
{
	List<Keyword> selectKeywordList(String userId);

	int selectTotalKeywordContent(String userId);

	int deleteKeyword(int keyCode);

	Member selectOneMember(String userId);

	int selectRadius(String userId);

	int updateRadius(Map<String, Object> map);

	int updateAddrAndLoc(Map<String, Object> map);

	int selectKeyword(Map<String, Object> key);

	List<Evaluate> selectAllEva(String userId);

	int selectTotalReview(String userId);

	List<Review> selectAllReview(String userId);

	int insertMemberLocAuth(Member member);

	List<Wish> selectAllSalesPro(String userId);

	List<Wish> selectAllBuyPro(String userId);

	List<Wish> selectAllWishPro(String userId);

	int insertKeyword(Keyword key);

	int deleteWish(int wishCode);

	int insertWish(Map<String, Object> map);

	List<Member> selectMemberList(int limit, int offset);

	int selectMemberTotalContents();

}
