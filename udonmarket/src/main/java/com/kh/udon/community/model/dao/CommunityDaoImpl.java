package com.kh.udon.community.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.udon.community.model.vo.Community;


@Repository
public class CommunityDaoImpl implements CommunityDao
{
    @Autowired
    private SqlSessionTemplate session;
    
    @Override
	public List<Community> selectCommunityList() {
//		RowBounds rowBounds = new RowBounds();
		return session.selectList("community.selectCommunityList");
	}
    
    @Override
	public Community selectOneCommunityCollection(int bCode) {
		return session.selectOne("community.selectOneCommunityCollection", bCode);
	}
    
//    @Override
//	public Community selectCategory(int categoryCode) {
//		return session.selectOne("community.selectCategory", categoryCode);
//	}
    

}
