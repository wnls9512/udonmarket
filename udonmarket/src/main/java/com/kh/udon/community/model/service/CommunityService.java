package com.kh.udon.community.model.service;

import java.util.List;

import com.kh.udon.community.model.vo.Community;


public interface CommunityService
{

	List<Community> selectCommunityList();
	
	Community selectOneCommunityCollection(int bCode);

//	Community selectCategory(int categoryCode);

//	int selectBoardTotalContents();
	
}
