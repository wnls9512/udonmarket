package com.kh.udon.chat.model.dao;

import java.util.List;

import com.kh.udon.chat.model.vo.ChatMessage;
import com.kh.udon.chat.model.vo.ChatRoom;

public interface ChatDao
{

	List<ChatRoom> selectChatRoom(String userId);

	List<ChatMessage> selectChatMsg(int roomCode);

}
