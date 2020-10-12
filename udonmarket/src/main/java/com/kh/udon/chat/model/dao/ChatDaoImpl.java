package com.kh.udon.chat.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.udon.chat.model.vo.ChatMessage;
import com.kh.udon.chat.model.vo.ChatRoom;

@Repository
public class ChatDaoImpl implements ChatDao
{
    @Autowired
    private SqlSessionTemplate session;

	@Override
	public List<ChatRoom> selectChatRoom(String userId) {
		return session.selectList("socket.selectChatRoom", userId);
	}

	@Override
	public List<ChatMessage> selectChatMsg(int roomCode) {
		return session.selectList("socket.selectChatMsg", roomCode);
	}

	@Override
	public int insertMsg(ChatMessage m) {
		return session.insert("socket.insertMsg", m);
	}
}
