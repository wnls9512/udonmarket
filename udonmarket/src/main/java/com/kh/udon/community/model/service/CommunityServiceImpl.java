package com.kh.udon.community.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.udon.community.model.dao.CommunityDao;
import com.kh.udon.community.model.vo.Community;
import com.kh.udon.community.model.vo.Search;

@Service
public class CommunityServiceImpl implements CommunityService
{
    @Autowired
    private CommunityDao dao;
    
    @Override
	public List<Community> selectCommunityList(Search search) {
		return dao.selectCommunityList(search);
	}
    
    @Override
	public Community selectOneCommunityCollection(int bCode) {
		return dao.selectOneCommunityCollection(bCode);
	}
    
//    @Override
//   	public Community selectCategory(int categoryCode) {
//   		return dao.selectCategory(categoryCode);
//   	}
    
}
