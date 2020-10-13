package com.kh.udon.community.model.service;

import java.util.List;

import com.kh.udon.community.model.vo.Community;
import com.kh.udon.community.model.vo.LikeThis;
import com.kh.udon.community.model.vo.Reply;
import com.kh.udon.community.model.vo.Report;
import com.kh.udon.community.model.vo.Search;


public interface CommunityService
{

	List<Community> selectCommunityList(Search search);
	/* List<Community> selectCommunityList(int categoryCode); */
	
	Community selectOneCommunityCollection(int bCode);

//	Community selectCategory(int categoryCode);

//	int selectBoardTotalContents();

	public List<Reply> ReplyList(int bCode) throws Exception;

	

	public int saveReply(Reply reply) throws Exception;

	

	public int updateReply(Reply reply) throws Exception;

	

	public int deleteReply(int replyCode) throws Exception;
	
	int insert(Community community);
	
	Community selectByBCode(int bCode);
	
	int update(Community community);
	
	int delete(int bCode);
	
	int likeThis(LikeThis like);
	
//	int deleteReply(int replyCode);

	List<Report> selectReportList(int limit, int offset);

	List<Report> selectReplyList(int limit, int offset);


	
}
