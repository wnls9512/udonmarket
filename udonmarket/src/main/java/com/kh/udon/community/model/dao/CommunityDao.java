package com.kh.udon.community.model.dao;

import java.util.List;

import com.kh.udon.community.model.vo.Community;
import com.kh.udon.community.model.vo.LikeThis;
import com.kh.udon.community.model.vo.Reply;
import com.kh.udon.community.model.vo.Report;
import com.kh.udon.community.model.vo.Search;


public interface CommunityDao
{

	List<Community> selectCommunityList(Search search);
	/* List<Community> selectCommunityList(int categoryCode); */
	
	Community selectOneCommunityCollection(int bCode);
	
//	Community selectCategory(int categoryCode);
	
	public List<Reply> ReplyList(int bCode) throws Exception;

	

	public int saveReply(Reply reply) throws Exception;

	

	public int updateReply(Reply reply) throws Exception;

	

	public int deleteReply(int replyCode) throws Exception;

	List<Report> selectReportList(int limit, int offset);

	List<Report> selectReplyList(int limit, int offset);

	
	
	int insert(Community community);
	
	Community selectByBCode(int bCode);
	
	int update(Community community);
	
	int delete(int bCode);
	
	int likeThis(LikeThis like);
	
}
