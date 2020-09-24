package com.kh.udon.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.udon.member.model.vo.Location;
import com.kh.udon.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao
{
    @Autowired
    private SqlSessionTemplate session;

	@Override
	public int updateLocation(Location loc) {
		return session.update("member.updateLocation", loc);
	}

}
