package com.kh.udon.community.model.dao;

import java.util.List;

import com.kh.udon.community.model.vo.Community;
import com.kh.udon.community.model.vo.Search;


public interface CommunityDao
{

	List<Community> selectCommunityList(Search search);
	
	Community selectOneCommunityCollection(int bCode);
	
//	Community selectCategory(int categoryCode);
	
}
