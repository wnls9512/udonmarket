package com.kh.udon.member.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.udon.member.model.vo.Evaluate;
import com.kh.udon.member.model.vo.Keyword;
import com.kh.udon.member.model.vo.Location;
import com.kh.udon.member.model.vo.Member;
import com.kh.udon.member.model.vo.Review;
import com.kh.udon.member.model.vo.Wish;
import com.kh.udon.product.model.vo.ProductVO;

public interface MemberDao
{

	int updateLocation(Map<String, Object> map);

	List<Keyword> selectKeywordList(String userId);

	int selectTotalKeywordContent(String userId);

	int deleteKeyword(int keyCode);

	Member selectOneMember(String userId);

	int selectRadius(String userId);

	int updateRadius(Map<String, Object> map);

	int updateAddr(Map<String, Object> map);

	int selectKeyword(Map<String, Object> key);

	List<Evaluate> selectAllEva(String userId);

	int selectTotalReview(String userId);

	List<Review> selectAllReview(String userId);

	int insertMember(Member member);

	int insertLocation(String userId);

	int insertAuthority(String userId);

	List<ProductVO> selectAllSalesPro(String userId);

	List<ProductVO> selectAllBuyPro(String userId);

	List<Wish> selectAllWishPro(String userId);

	int insertKeyword(Keyword key);

	int deleteWish(int wishCode);

	int insertWish(Map<String, Object> map);


}
