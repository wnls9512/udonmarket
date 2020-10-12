package com.kh.udon.chat.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.udon.chat.model.dao.ChatDao;
import com.kh.udon.chat.model.vo.ChatMessage;
import com.kh.udon.chat.model.vo.ChatRoom;

@Service
public class ChatServiceImpl implements ChatService
{
    @Autowired
    private ChatDao dao;

	@Override
	public List<ChatRoom> selectChatRoom(String userId) {
		return dao.selectChatRoom(userId);
	}

	@Override
	public List<ChatMessage> selectChatMsg(int roomCode) {
		return dao.selectChatMsg(roomCode);
	}

	@Override
	public int insertMsg(ChatMessage m) {
		return dao.insertMsg(m);
	}


}
