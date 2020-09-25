package com.kh.udon.community.model.dao;

import java.util.List;

import com.kh.udon.community.model.vo.Community;


public interface CommunityDao
{

	List<Community> selectCommunityList();
	
	Community selectOneCommunityCollection(int bCode);
	
//	Community selectCategory(int categoryCode);
	
}
