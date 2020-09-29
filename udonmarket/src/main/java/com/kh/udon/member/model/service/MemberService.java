package com.kh.udon.member.model.service;

import java.util.List;
import java.util.Map;

import com.kh.udon.member.model.vo.Evaluate;
import com.kh.udon.member.model.vo.Keyword;
import com.kh.udon.member.model.vo.Location;
import com.kh.udon.member.model.vo.Member;
import com.kh.udon.member.model.vo.Review;
import com.kh.udon.product.model.vo.ProductVO;

public interface MemberService
{
	int insertKeyword(Map<String, Object> map);

	List<Keyword> selectKeywordList(String userId);

	int selectTotalKeywordContent(String userId);

	int deleteKeyword(int keyCode);

	int insertMember(Member member);

	Member selectOneMember(String userId);

	int selectRadius(String userId);

	int updateRadius(Map<String, Object> map);

	int updateAddrAndLoc(Map<String, Object> map);

	int selectKeyword(Map<String, Object> key);

	List<Evaluate> selectAllEva(String userId);

	int selectTotalReview(String userId);

	List<Review> selectAllReview(String userId);

	List<ProductVO> selectAllSalesPro(String userId);

	List<ProductVO> selectAllBuyPro(String userId);

	List<ProductVO> selectAllWishPro(String userId);
}
