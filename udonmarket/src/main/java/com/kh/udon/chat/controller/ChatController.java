package com.kh.udon.chat.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.udon.chat.model.service.ChatService;
import com.kh.udon.chat.model.vo.ChatMessage;
import com.kh.udon.chat.model.vo.ChatRoom;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/chat")
@Slf4j
public class ChatController
{
	@Autowired
    private ChatService service;
    
    @RequestMapping("/chatListView")
    public Model chatList(@RequestParam("userId") String userId,
    					   Model model){
    	
    	List<ChatRoom> list = service.selectChatRoom(userId);
    	log.debug("list = {}", list);
    	model.addAttribute("list", list);
    	
        return model;
    }
    
    @PostMapping("/selectChatMsg")
    @ResponseBody
    public Map<String, Object> selectChatMsg(@RequestParam("roomCode") int roomCode){
    	Map<String, Object> map = new HashMap<>();
    	
    	List<ChatMessage> list = service.selectChatMsg(roomCode);
    	log.debug("list = {}", list);
    	
    	map.put("list", list);
    	return map;
    }
    
    @PostMapping("/openChatRoom")
    @ResponseBody
    public String openChatRoom(@RequestParam("userId") String userId,
							   @RequestParam("seller") String seller,
							   @RequestParam("pCode") int pCode){

    	Map<String, Object> map = new HashMap<>();
    	map.put("userId", userId);
    	map.put("seller", seller);
    	map.put("pCode", pCode);
    	
    	//이미 열려있는 채팅방이 있는지 체크
    	ChatRoom chatRoom = service.selectChatRoom(map);
    	
    	if(chatRoom == null) {
    		//새로운 채팅방 만들기
    		int result = service.insertChatRoom(map);
    		//System.out.println(result);
    	}else {
    		//활성화 여부를 모두 true로 바꾸기 (혹시 나갔을 지도 모르니까)
    		map.put("roomCode", chatRoom.getRoomCode());
    		
    		int enabled = service.enterChatRoom(map);
    		//System.out.println(enabled);
    	}
    	
    	String url = "/chat/chatListView?userId=" + userId;
   
    	return url;
    }

    @PostMapping("/leaveChatRoom")
    @ResponseBody
    public String leaveChatRoom(@RequestParam("roomCode") int roomCode,
    							@RequestParam("userId") String userId){
    	
    	Map<String, Object> map = new HashMap<>();
    	map.put("userId", userId);
    	map.put("roomCode", roomCode);
    	
    	String url = "/chat/chatListView?userId=" + userId;
    	try {
    		int result = service.leaveChatRoom(map);
    	}catch (Exception e) {
    		e.printStackTrace();
    	}

    	return url;
    }    
}
