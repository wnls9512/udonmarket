package com.kh.udon.community.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.udon.community.model.dao.CommunityDao;
import com.kh.udon.community.model.vo.Community;
import com.kh.udon.community.model.vo.LikeThis;
import com.kh.udon.community.model.vo.Reply;
import com.kh.udon.community.model.vo.Report;
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
    
	/*
	 * @Override public List<Community> selectCommunityList(int categoryCode) {
	 * return dao.selectCommunityList(categoryCode); }
	 */
    
    @Override
	public Community selectOneCommunityCollection(int bCode) {
		return dao.selectOneCommunityCollection(bCode);
	}
    
//    @Override
//   	public Community selectCategory(int categoryCode) {
//   		return dao.selectCategory(categoryCode);
//   	}
    
    @Override

	public List<Reply> ReplyList(int bCode) throws Exception {

		return dao.ReplyList(bCode);

	}



	@Override

	public int saveReply(Reply reply) throws Exception {

		return dao.saveReply(reply);

	}



	@Override

	public int updateReply(Reply reply) throws Exception {

		return dao.updateReply(reply);

	}



	@Override

	public int deleteReply(int replyCode) throws Exception {

		return dao.deleteReply(replyCode);

	}

	@Override
	
	public List<Report> selectReportList(int limit, int offset) {
		
		return dao.selectReportList(limit, offset);
		
	}

	@Override
	
	public List<Report> selectReplyList(int limit, int offset) {
		
		return dao.selectReplyList(limit,offset);
		
	}




	 @Override
	    public int insert(Community community)
	    {
	        return dao.insert(community);
	    }
	 
	 
	 @Override
	    public Community selectByBCode(int bCode)
	    {
	        return dao.selectByBCode(bCode);
	    }
	 
	 @Override
	    public int update(Community community)
	    {
	        return dao.update(community);
	    }

	 @Override
	    public int delete(int bCode)
	    {
	        return dao.delete(bCode);
	    }
    
	 @Override
	    public int likeThis(LikeThis like)
	    {
	        return dao.likeThis(like);
	    }
}
