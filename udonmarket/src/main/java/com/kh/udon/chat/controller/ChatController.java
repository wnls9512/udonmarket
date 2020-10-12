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
    
}
