package com.kh.udon.community.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.udon.community.model.dao.CommunityDao;

@Service
public class CommunityServiceImpl implements CommunityService
{
    @Autowired
    private CommunityDao dao;
}
