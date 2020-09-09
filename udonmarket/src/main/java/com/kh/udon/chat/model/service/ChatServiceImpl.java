package com.kh.udon.chat.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.udon.chat.model.dao.ChatDao;

@Service
public class ChatServiceImpl implements ChatService
{
    @Autowired
    private ChatDao dao;
}
