package com.kh.udon.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.udon.member.model.dao.MemberDao;
import com.kh.udon.member.model.vo.Location;
import com.kh.udon.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService
{
    @Autowired
    private MemberDao memberDao;

	@Override
	public int updateLocation(Location loc) {
		return memberDao.updateLocation(loc);
	}

}
