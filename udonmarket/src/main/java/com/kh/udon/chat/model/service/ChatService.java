package com.kh.udon.chat.model.service;

import java.util.List;

import com.kh.udon.chat.model.vo.ChatMessage;
import com.kh.udon.chat.model.vo.ChatRoom;

public interface ChatService
{

	List<ChatRoom> selectChatRoom(String userId);

	List<ChatMessage> selectChatMsg(int roomCode);

}
