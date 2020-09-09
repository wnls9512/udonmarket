package com.kh.udon.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.udon.chat.model.service.ChatService;

@Controller
@RequestMapping("/chat")
public class ChatController
{
    @Autowired
    private ChatService service;
    
    @RequestMapping("/chatListView")
    public String chatList()
    {
        return "chat/chatListView";
    }
}
