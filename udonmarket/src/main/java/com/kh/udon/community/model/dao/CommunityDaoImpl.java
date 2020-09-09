package com.kh.udon.community.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommunityDaoImpl implements CommunityDao
{
    @Autowired
    private SqlSessionTemplate session;
}
