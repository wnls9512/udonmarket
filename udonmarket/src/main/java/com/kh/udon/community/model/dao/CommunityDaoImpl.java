package com.kh.udon.community.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.udon.community.model.vo.Community;
import com.kh.udon.community.model.vo.LikeThis;
import com.kh.udon.community.model.vo.Reply;
import com.kh.udon.community.model.vo.Report;
import com.kh.udon.community.model.vo.Search;


@Repository
public class CommunityDaoImpl implements CommunityDao
{
    @Autowired
    private SqlSessionTemplate session;
    
    @Override
	public List<Community> selectCommunityList(Search search) {
//		RowBounds rowBounds = new RowBounds();
		return session.selectList("community.selectCommunityList", search);
	}
    
	/*
	 * @Override public List<Community> selectCommunityList(int categoryCode) { //
	 * RowBounds rowBounds = new RowBounds(); return
	 * session.selectList("community.selectCommunityList", categoryCode); }
	 */
    
    @Override
	public Community selectOneCommunityCollection(int bCode) {
		return session.selectOne("community.selectOneCommunityCollection", bCode);
	}
    
//    @Override
//	public Community selectCategory(int categoryCode) {
//		return session.selectOne("community.selectCategory", categoryCode);
//	}
    
    @Override

	public List<Reply> ReplyList(int bCode) throws Exception {

		return session.selectList("communityReply.ReplyList", bCode);

	}



	@Override

	public int saveReply(Reply reply) throws Exception {

		return session.insert("communityReply.saveReply", reply);

	}



	@Override

	public int updateReply(Reply reply) throws Exception {

		return session.update("communityReply.updateReply", reply);

	}



	@Override

	public int deleteReply(int replyCode) throws Exception {

		return session.delete("communityReply.deleteReply", replyCode);

	}
	
	 @Override
	    public int insert(Community community)
	    {
	        return session.insert("community.insert", community);
	    }
	 
	 @Override
	    public Community selectByBCode(int bCode)
	    {
	        return session.selectOne("community.selectByBCode", bCode);
	    }
	 
	 @Override
	    public int update(Community community)
	    {
	        return session.update("community.update", community);
	    }

	 @Override
	    public int delete(int bCode)
	    {
	        return session.delete("community.delete", bCode);
	    }

	 @Override
	    public int likeThis(LikeThis like)
	    {
	        return session.insert("community.createBoardLike", like);
	    }

	 
	@Override
	
	public List<Report> selectReportList(int limit, int offset) {
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return session.selectList("community.selectReportList", null, rowBounds);
		
	}


	@Override
	
	public List<Report> selectReplyList(int limit, int offset) {

		RowBounds rowBounds = new RowBounds(offset, limit);

		return session.selectList("communityReply.selectReplyList", null, rowBounds);
		
	}
}
