package com.kh.udon.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.udon.community.model.service.CommunityService;

@Controller
@RequestMapping("/community")
public class CommunityController
{
    @Autowired
    private CommunityService service;
    
    @RequestMapping("/communityListView")
    public String communityList()
    {
        return "community/communityListView";
    }
    
    @RequestMapping("/communityDetailView")
    public String communityDetail()
    {
        return "community/communityDetailView";
    }
}
