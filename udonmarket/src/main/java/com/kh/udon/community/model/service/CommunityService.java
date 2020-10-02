package com.kh.udon.community.model.service;

import java.util.List;

import com.kh.udon.community.model.vo.Community;
import com.kh.udon.community.model.vo.Search;


public interface CommunityService
{

	List<Community> selectCommunityList(Search search);
	
	Community selectOneCommunityCollection(int bCode);

//	Community selectCategory(int categoryCode);

//	int selectBoardTotalContents();
	
}
