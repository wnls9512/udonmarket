package com.kh.udon.community.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.udon.community.model.dao.CommunityDao;
import com.kh.udon.community.model.vo.Community;

@Service
public class CommunityServiceImpl implements CommunityService
{
    @Autowired
    private CommunityDao dao;
    
    @Override
	public List<Community> selectCommunityList() {
		return dao.selectCommunityList();
	}
}
